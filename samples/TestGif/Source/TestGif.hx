package;

import file.load.FileLoad;

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

  // Run some tests
  public function new()
  {
    trace("Test Gif Launch!");

    TraceTimer.activate();

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