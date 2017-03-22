package gif;

import haxe.Timer;
import haxe.io.Bytes;

import gif.images.GifDecoder;
import gif.images.GifFrameInfo;

/**
 * An array of Gif Frame to display
 * 
 * Not really optimized, each frame are a single bitmapData (not one over the other)
 */
@:generic
class GifDisplay<T:GifFrame<T>>
{
  // Frames
  public var frames:Array<T> = [];
  private var infos:Array<GifFrameInfo>;
  
  // Dimension
  public var width:Int;
  public var height:Int;
  
  // Timer
  public var playing:Bool = false;
  var timer:Timer = null;
  var pos:Int = -1;
  
  // Constructor
  public function new( data:Bytes ) 
  {
    infos = GifDecoder.decode(data).frameList;
    
    play(); // Play by default
  }
  
  // Clean
  public function clean()
  {
    stop();
    
    for ( frame in frames )
    {
      frame.clean();
    }
    
    frames = null;
    infos = null;
  }
  
  // Display this frame
  public function setFrame( frame:T, visible = true )
  {
    // Override me ;)
  }
  
  // Create a GifFrame object
  public function createGifFrame( width:Int, height:Int ):T
  {
    // Override me ;)
    return null;
  }
  
  // Create a frame
  function createFrame( pos:Int )
  {
    if ( frames[pos] != null ) return;
    
    var info = infos[pos];
    if ( info == null ) return;
    
    trace("CREATING FRAME", pos, info.disposalMethod == 1);
    
    var frame:T;
    var offsetX = 0;
    var offsetY = 0;
    
    if ( /*(info.disposalMethod == 1) &&*/ (pos > 0) )
    {
      var p = pos;
      while ( (p-- > 0) && (infos[p].disposalMethod != 1) ) {};
      
      frame = frames[p].clone();
      
      offsetX = info.imageLeftPosition;
      offsetY = info.imageTopPosition;
    }
    else
    {
      frame = createGifFrame( info.imageWidth, info.imageHeight );
      
      width = info.imageWidth;
      height = info.imageHeight;
    }
    
    frame.pos = pos;
    frames[pos] = frame;
    
    var rgbaImageData = info.getRgbaImageData();
    var index = 0;
    if ( info.interlaceFlag )
    {
      var startingLine = 0;
      var lineIncrement = 8;
      var line = 0;
      for (pass in 0...4)
      {
        switch (pass)
        {
          case 0: { startingLine = 0; lineIncrement = 8; }
          case 1: { startingLine = 4; lineIncrement = 8; }
          case 2: { startingLine = 2; lineIncrement = 4; }
          case 3: { startingLine = 1; lineIncrement = 2; }
        }
        line = startingLine;
        while (line < info.imageHeight)
        {
          for (xIndex in 0...info.imageWidth)
          {
            var rgba = rgbaImageData[index];
            frame.setPixel(xIndex + offsetX, line + offsetY, rgba);
            index++;
          }
          line += lineIncrement;
        }
      }
    }
    else
    {
      for (i in 0...rgbaImageData.length)
      {
        var rgba = rgbaImageData[i];
        frame.setPixel(Std.int(i % info.imageWidth) + offsetX, Std.int(i/info.imageWidth) + offsetY, rgba);
      }
    }
    
    if ( (info.disposalMethod != 1) || (pos == 0) )
    {
      //frame.x = info.imageLeftPosition;
      //frame.y = info.imageTopPosition;
    }
    
    info.clearBinaryData();
  }
  
  // Handle next frmae
  function nextFrame()
  {
    if ( timer != null ) timer.stop();
    
    pos = (pos+1) % infos.length;
    
    if ( frames[pos] == null ) createFrame( pos );
    setFrame( frames[pos] );
    
    timer = new Timer( infos[pos].delayTime > 10 ? infos[pos].delayTime * 10 : 100 );
    timer.run = nextFrame;
  }
  
  // Play
  public function play()
  {
    if ( playing ) return;
    
    playing = true;
    nextFrame();
  }
  
  // Stop
  public function stop()
  {
    if ( !playing ) return;
    
    playing = false;
    
    timer.stop();
    timer = null;
  }
}