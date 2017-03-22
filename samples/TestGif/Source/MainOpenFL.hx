package;

import openfl.display.Sprite;

import gif.openfl.GifOpenFL;

/**
 * Test the gif2 library in OpenFL
 */
class MainOpenFL extends Sprite
{
  var test:TestGif<GifOpenFL>;

  // Run some tests
	public function new()
  {
		super();

		var test = new TestGif<GifOpenFL>( function( gif )
    {
      trace("Gif!");
      
      // Get OpenFL Sprite
      addChild( gif.display );
    });
	}
}