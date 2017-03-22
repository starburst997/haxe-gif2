package;

import file.load.FileLoad;

import gif.AnimatedGif;

import statistics.TraceTimer;
import statistics.Stats;

/**
 * Class used to Test / Compile haxe-gif2 library
 */
class TestGif
{
  // List of files
  public static inline var PATH:String = "./assets/";
  public static inline var TEST1:String = PATH + "test.gif";

  // Stats
  var stats = new Stats();

  // Handler
  var handler:AnimatedGif->Void = null;
  
  // Gif Decoder
  var gif:AnimatedGif = null;
  
  // Run some tests
  public function new( handler:AnimatedGif->Void )
  {
    trace("Test Gif Launch!");

    TraceTimer.activate();

    this.handler = handler;
    
    loadURL( TEST1 );
  }

  // Load a GIF Bytes and decode it
  function loadURL( url:String )
  {
    FileLoad.loadBytes(
    {
      url: url,
      complete: function(data)
      {
        // Alright decode this!
        if ( data != null )
        {
          trace("GIF Bytes loaded!");
          
          gif = new AnimatedGif( data );
          gif.play();
          
          if ( handler != null ) handler( gif );
        }
      },
      progress: function(percent)
      {
        trace("Progress", percent);
      },
      error: function(error)
      {
        trace("Error", error);
      }
    });
  }
}