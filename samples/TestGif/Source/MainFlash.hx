package;

import gif.flash.GifFlash;
import gif.flash.GifFlash2;

import flash.Lib;

/**
 * Class used to Test / Compile haxe-gif2 library
 *
 * Install https://github.com/tapio/live-server and start from html5 folder
 * Simply issue "live-server" inside the html5 folder and build (release for faster build)
 * Server will reload page automatically when JS is compiled
 */
class MainFlash
{
  public function new()
  {
    //var test = new TestGif<GifFlash>( function( gif )
		var test = new TestGif<GifFlash2>( function( gif )
    {
      trace("Gif!");
      
      // Get OpenFL Sprite
      Lib.current.stage.addChild( gif.display );
    });
  }

  static function main()
  {
    new MainFlash();
  }
}