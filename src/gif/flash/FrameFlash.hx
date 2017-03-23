package gif.flash;

import gif.color.Rgba;

import flash.display.BitmapData;

/**
 * Flash Gif Frame
 */
class FrameFlash extends GifFrame<FrameFlash>
{
  // BitmapData
  public var bitmapData:BitmapData = null;
  
  // Constructor
  public function new( width:Int, height:Int, bitmapData:BitmapData = null ) 
  {
    super( width, height );
    
    this.bitmapData = (bitmapData == null) ? (new BitmapData( width, height, true, 0x00000000 )) : bitmapData;
    this.bitmapData.lock();
  }
  
  // Create a GifFrame object
  public override function clone()
  {
    var frame = new FrameFlash( width, height, bitmapData.clone() );
    frame.x = x;
    frame.y = y;
    
    return frame;
  }
  
  // Clean
  public override function clean()
  {
    bitmapData.dispose();
  }
  
  // Set pixel value
  public override function setPixel( x:Int, y:Int, color:Rgba )
  {
    bitmapData.setPixel32( x, y, color );
  }
}