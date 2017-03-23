package gif.pixijs;

import gif.color.Rgba;

import js.Browser;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

/**
 * PixiJS Gif Frame
 */
class FramePixiJS extends GifFrame<FramePixiJS>
{
  // BitmapData
  public var canvas:CanvasElement;
  public var context:CanvasRenderingContext2D = null;
  
  // Constructor
  public function new( width:Int, height:Int, canvas:CanvasElement = null ) 
  {
    super( width, height );
    
    // Create BitmapData
    this.canvas = cast( Browser.document.createElement('canvas'), CanvasElement );
    this.context = this.canvas.getContext2d();
    
    this.canvas.width = width;    
    this.canvas.height = height;
    
    if ( canvas != null )
    {
      this.context.drawImage( canvas, 0, 0 );
    }
  }
  
  // Create a GifFrame object
  public override function clone()
  {
    var frame = new FramePixiJS( width, height, canvas );
    frame.x = x;
    frame.y = y;
    
    return frame;
  }
  
  // Clean
  public override function clean()
  {
    canvas = null;
    context = null;
  }
  
  // Set pixel value
  public override function setPixel( x:Int, y:Int, color:Rgba )
  {
    context.fillStyle = "rgba("+color.red+","+color.green+","+color.blue+","+(color.alpha/255)+")";
    context.fillRect( x, y, 1, 1 );
  }
}