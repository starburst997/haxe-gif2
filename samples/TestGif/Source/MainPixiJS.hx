package;

import openfl.display.Sprite;

import gif.openfl.GifOpenFL;
import gif.openfl.GifOpenFL2;

/**
 * Test the gif2 library in OpenFL
 */
class MainOpenFL extends Sprite
{
  // Run some tests
	public function new()
  {
		super();
    
    //var test = new TestGif<GifOpenFL>( function( gif )
		var test = new TestGif<GifOpenFL2>( function( gif )
    {
      trace("Gif!");
      
      // Get OpenFL Sprite
      addChild( gif.display );
    });
	}
}