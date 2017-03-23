package gif.flash;

import flash.display.PixelSnapping;
import haxe.io.Bytes;

import gif.GifDisplay;

import gif.flash.FrameFlash;

import flash.display.Bitmap;

/**
 * A Flash Gif
 */
class GifFlash extends GifDisplay<FrameFlash>
{
  // Display
  public var display:Bitmap;
  
  // Constructor
  public function new( data:Bytes ) 
  {
    display = new Bitmap( null, PixelSnapping.AUTO, true );
    
    super( data );
  }
  
  // Display this frame
  public override function setFrame( frame, visible = true )
  {
    frame.bitmapData.unlock();
    
    display.bitmapData = frame.bitmapData;
    
    display.x = frame.x;
    display.y = frame.y;
  }
  
  // Create a GifFrame object
  public override function createGifFrame( width:Int, height:Int )
  {
    return new FrameFlash( width, height );
  }
}