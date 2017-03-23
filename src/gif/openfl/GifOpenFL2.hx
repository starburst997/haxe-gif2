package gif.openfl;

import haxe.io.Bytes;

import gif.GifDisplay;

import gif.openfl.FrameOpenFL;

import openfl.display.PixelSnapping;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * An OpenFL Gif
 */
class GifOpenFL2 extends GifDisplay2<FrameOpenFL>
{
  // Display
  public var display:Sprite;
  
  // Frames
  public var bmps:Array<Bitmap> = [];
  
  // Constructor
  public function new( data:Bytes ) 
  {
    display = new Sprite();
    
    super( data );
  }
  
  // Clean
  public override function clean()
  {
    super.clean();
    
    while ( display.numChildren > 0 )
    {
      display.removeChildAt( 0 );
    }
    
    bmps = null;
    display = null;
  }
  
  // Display this frame
  public override function setFrame( frame, visible = true )
  {
    var bmp:Bitmap = null;
    if ( bmps[frame.pos] == null )
    {
      bmp = new Bitmap( frame.bitmapData, PixelSnapping.AUTO, true );
      frame.bitmapData.unlock();
      
      bmp.x = frame.x;
      bmp.y = frame.y;
      
      display.addChild( bmp );
      
      bmps[frame.pos] = bmp;
    }
    else
    {
      bmp = bmps[frame.pos];
    }
    
    bmp.visible = visible;
  }
  
  // Create a GifFrame object
  public override function createGifFrame( width:Int, height:Int )
  {
    return new FrameOpenFL( width, height );
  }
}