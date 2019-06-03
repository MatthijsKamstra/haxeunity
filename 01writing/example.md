# Writing example


Simple write to a file. Can't make it more glamours.
In this example we will use Haxe specific code that can be used for other `sys` targets (lua, python, neko, cpp, hl, php, java, cs) as well.

For this example I used the "unity-haxe-helloworld" Nadako made: <https://github.com/nadako/unity-haxe-helloworld>.
But I don't want all these files in my documentation, so for this example I use the same folder structure but won't use the unity files (you should use the files Nadako profided)

```
+ unity-haxe-helloworld
	+ Assets
		+ Code
	+ Source
		- Main.hx
	- build.hxml
```

## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.

```
import sys.io.File;
class Main {
	function new() {
		trace('Writing example');

		var str:String = 'Hello World!\nWritten on: ' + Date.now().toString();
		sys.io.File.saveContent('hello.txt', str);
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


