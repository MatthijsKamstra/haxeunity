package ;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	function new(){
		trace("C# reading and writing Example");

		var str:String = 'Writing and reading a simple text file.!\nWritten on: ' + Date.now().toString();

		// write the file the Haxe way: will work on sys targets (lua, python, neko, cpp, hl, php, java, cs)
		sys.io.File.saveContent('hello.txt', str);

		// read the file
		var content = sys.io.File.getContent('hello.txt');
		trace (content);
	}

	static public function main() {
		var main = new Main();
	}
}