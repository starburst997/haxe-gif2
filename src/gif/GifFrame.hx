package gif;

/**
 * Gif Frame
 */
@:generic
class GifFrame<T>
{
  // Dimensions
  public var width:Int = 0;
  public var height:Int = 0;
  
  // Position
  public var x:Int = 0;
  public var y:Int = 0;
  
  // Constructor
  public function new( width:Int, height:Int ) 
  {
    this.width = width;
    this.height = height;
  }
  
  // Set pixel value
  public function setPixel( x:Int, y:Int, color:Int )
  {
    // Override me ;)
  }
  
  // Clone
  public function clone():T
  {
    return null;
  }
}