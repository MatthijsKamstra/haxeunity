package;

import cs.system.io.File;
import cs.system.Console;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	function new() {
		Console.WriteLine("C# writing example, native");
		// @source: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/file-system/how-to-write-to-a-text-file
		var str:String = 'Hello World!\nWritten on: ' + Date.now().toString();
		// WriteAllText creates a file, writes the specified string to the file,
		// and then closes the file.    You do NOT need to call Flush() or Close().
		File.WriteAllText("hello.txt", str);
	}

	static public function main() {
		var main = new Main();
	}
}
