package gif.pixijs;

import haxe.io.Bytes;

import gif.GifDisplay;
import gif.pixijs.FramePixiJS;

import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

/**
 * A PixiJS Gif
 */
class GifPixiJS extends GifDisplay<FramePixiJS>
{
  // Display
  public var display:Sprite;
  
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
    
    if ( display.texture != null ) 
    {
      display.texture.baseTexture.destroy();
      display.texture.destroy();
    }
    
    display.destroy();
    display = null;
  }
  
  // Display this frame
  public override function setFrame( frame, visible = true )
  {
    // TODO: Might not be super optimized...
    if ( display.texture != null ) 
    {
      // Clean
      display.texture.baseTexture.destroy();
      display.texture.destroy();
    }
    
    display.texture = Texture.fromCanvas( frame.canvas );
    
    display.x = frame.x;
    display.y = frame.y;
  }
  
  // Create a GifFrame object
  public override function createGifFrame( width:Int, height:Int )
  {
    return new FramePixiJS( width, height );
  }
}