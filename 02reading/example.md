# Example

Simply write and read a file.


## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ bin
	+ src
		- Main.hx
	- build.hxml
```


## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.


```
class Main {
	function new(){
		trace("Reading and writing example");

		var str:String = 'Writing and reading a simple text file.!\nWritten on: ' + Date.now().toString();

		// write the file
		sys.io.File.saveContent('hello.txt', str);

		// read the file
		var content = sys.io.File.getContent('hello.txt');
		trace (content);
	}

	static public function main() {
		var main = new Main();
	}
}
```




## The Haxe build file, build.hxml

I use one [`build.hxml`](/code/build.hxml) to build all other build files:

- build_cpp.hxml
- build_cs.hxml
- build_java.hxml
- build_node.hxml
- build_python.hxml

Check out the files in the [`/code`](/code)-folder.



## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter





