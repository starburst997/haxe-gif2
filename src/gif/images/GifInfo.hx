/*
 * Copyright (c) 2013 Heriet [http://heriet.info/].
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package gif.images;

import gif.color.Rgb;
import gif.color.Rgba;

enum Version {
    Gif87a;
    Gif89a;
}
 
class GifInfo
{
    /* GIF Header */
    public var version: Version;
    public var logicalScreenWidth: Int;
    public var logicalScreenHeight: Int;
    public var globalColorTableFlag: Bool;
    public var colorResolution: Int;
    public var sortFlag: Bool;
    public var sizeOfGlobalTable: Int;
    public var backgroundColorIndex: Int;
    public var pixelAspectRaito: Int;
    
    /* Global Color Table*/
    public var globalColorTable: Array<Rgb>;
    
    /* Gif Frame */
    public var frameList: Array<GifFrameInfo>;
    public var numFrames(get, never): Int;
    
    /* Gif Animation */
    public var animationLoopCount: Int;
    
    public function new() 
    {
        globalColorTable = [];
        frameList = [];
    }
    
    function get_numFrames() : Int
    {
        return frameList.length;
    }
	
	public function toString() : String
	{
		var str = "\n{\n";
		str += '  logicalScreenWidth=$logicalScreenWidth\n';
		str += '  logicalScreenHeight=$logicalScreenHeight\n';
		str += '  globalColorTableFlag=$globalColorTableFlag\n';
		str += '  colorResolution=$colorResolution\n';
		str += '  sortFlag=$sortFlag\n';
		str += '  sizeOfGlobalTable=$sizeOfGlobalTable\n';
		str += '  backgroundColorIndex=$backgroundColorIndex\n';
		str += '  pixelAspectRaito=$pixelAspectRaito\n';
		str += '  frames = \n';
		str += '  [\n';
		for (f in frameList)
		{
			str += '    disposalMethod=${f.disposalMethod}, interlaceFlag=${f.interlaceFlag}, ${f.sortFlag}\n';
		}
		str += '  ]\n';
		str += "}";
		return str;
	}
}
