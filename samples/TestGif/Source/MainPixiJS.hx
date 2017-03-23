package;

import js.Browser;

import gif.pixijs.GifPixiJS;
import gif.pixijs.GifPixiJS2;

import pixi.core.Pixi;
import pixi.core.display.Container;
import pixi.plugins.app.Application;

/**
 * Class used to Test / Compile haxe-gif2 library
 *
 * Install https://github.com/tapio/live-server and start from html5 folder
 * Simply issue "live-server" inside the html5 folder and build (release for faster build)
 * Server will reload page automatically when JS is compiled
 */
class MainPixiJS extends Application
{
  // Init
  public function new()
  {
    super();
    
    width = Browser.window.innerWidth;
    height = Browser.window.innerHeight;
    
    // Stage properties
    position = Application.POSITION_FIXED;
    backgroundColor = 0x006666;
    transparent = false;// true;
    antialias = false;
    pixelRatio = 1;
    autoResize = true;
    clearBeforeRender = true;
    
    start();
    
    //var test = new TestGif<GifPixiJS>( function( gif )
		var test = new TestGif<GifPixiJS2>( function( gif )
    {
      trace("Gif!");
      
      // Get OpenFL Sprite
      stage.addChild( gif.display );
    });
  }

  // Entry point
  static function main()
  {
    new MainPixiJS();
  }
}