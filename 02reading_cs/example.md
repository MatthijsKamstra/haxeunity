# Example

Simply write and read a file.


## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ src
		- Main.hx
	- build.hxml
```


## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.


```
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

		var content = File.ReadAllText("hello.txt");
		Console.WriteLine(content);
	}

	static public function main() {
		var main = new Main();
	}
}
```



## The Haxe build file, build.hxml

Copy and past the following lines in a document named `build.hxml`
This is the short version, you want to chech out the full version open this [file](/code/build.hxml);

```
# // build.hxml
-cp src
-main Main
-cs out
-dce full
--next
-cmd cd out/bin
-cmd mono Main.exe
```


## Build C# with Haxe and start export with mono

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter





