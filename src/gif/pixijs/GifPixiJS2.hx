package gif.pixijs;

import haxe.io.Bytes;

import gif.GifDisplay;
import gif.pixijs.FramePixiJS;

import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

/**
 * A PixiJS Gif
 */
class GifPixiJS2 extends GifDisplay2<FramePixiJS>
{
  // Display
  public var display:Sprite;
  
  // Frames
  public var sprites:Array<Sprite> = [];
  
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
    
    while ( display.children.length > 0 )
    {
      display.removeChildAt(0);
    }
    
    for ( sprite in sprites )
    {
      if ( sprite.texture != null ) 
      {
        sprite.texture.baseTexture.destroy();
        sprite.texture.destroy();
      }
      
      sprite.destroy();
    }
    
    sprites = null;
    
    display.destroy();
    display = null;
  }
  
  // Display this frame
  public override function setFrame( frame, visible = true )
  {
    var sprite:Sprite = null;
    if ( sprites[frame.pos] == null )
    {
      sprite = new Sprite( Texture.fromCanvas(frame.canvas) );
      sprite.x = frame.x;
      sprite.y = frame.y;
      
      display.addChild( sprite );
      
      sprites[frame.pos] = sprite;
      
      // Technically we can get rid of the canvas
      frame.clean();
    }
    else
    {
      sprite = sprites[frame.pos];
    }
    
    sprite.visible = visible;
  }
  
  // Create a GifFrame object
  public override function createGifFrame( width:Int, height:Int )
  {
    return new FramePixiJS( width, height );
  }
}