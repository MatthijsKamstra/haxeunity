package;

import sys.io.File;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	function new() {
		trace("C# writing example, Haxe");

		var str:String = 'Hello World!\nWritten on: ' + Date.now().toString();
		// writing the Haxe way: will work on sys targets (lua, python, neko, cpp, hl, php, java, cs)
		sys.io.File.saveContent('hello.txt', str);
	}

	static public function main() {
		var main = new Main();
	}
}
