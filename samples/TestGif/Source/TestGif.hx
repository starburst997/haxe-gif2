package;

import haxe.io.Bytes;

import file.load.FileLoad;

import statistics.TraceTimer;
import statistics.Stats;

/**
 * Class used to Test / Compile haxe-gif2 library
 */
@:generic
class TestGif<T:haxe.Constraints.Constructible<Bytes->Void>>
{
  // List of files
  public var PATH:String = "./assets/";
  public var TEST1:String = "test.gif";

  // Stats
  var stats = new Stats();

  // Handler
  var handler:T->Void = null;
  
  // Run some tests
  public function new( handler:T->Void )
  {
    trace("Test Gif Launch!");

    TraceTimer.activate();

    this.handler = handler;
    
    loadURL( PATH + TEST1 );
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
          
          var gif = new T( data );
          
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