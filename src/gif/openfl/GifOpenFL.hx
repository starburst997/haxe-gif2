package gif.openfl;

import haxe.io.Bytes;

import gif.GifDisplay;

import gif.openfl.FrameOpenFL;

import openfl.display.Bitmap;

/**
 * An OpenFL Gif
 */
class GifOpenFL extends GifDisplay<FrameOpenFL>
{
  // Display
  public var display:Bitmap;
  
  // Constructor
  public function new( data:Bytes ) 
  {
    display = new Bitmap();
    
    super( data );
  }
  
  // Display this frame
  public override function setFrame( frame )
  {
    display.bitmapData = frame.bitmapData;
    
    display.x = frame.x;
    display.y = frame.y;
  }
  
  // Create a GifFrame object
  public override function createGifFrame( width:Int, height:Int )
  {
    return new FrameOpenFL( width, height );
  }
}