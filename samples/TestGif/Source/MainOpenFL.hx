package;

import openfl.display.Sprite;

/**
 * Test the gif2 library in OpenFL
 */
class MainOpenFL extends Sprite
{
  var test:TestGif;

  // Run some tests
	public function new()
  {
		super();

		test = new TestGif();
	}
}