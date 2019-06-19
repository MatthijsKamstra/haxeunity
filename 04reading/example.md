# Example Reading

Simply write and read a file. Can't make it more glamorous.
In this example we will use Haxe specific code that can be used for other `sys` targets (lua, python, neko, cpp, hl, php, java, cs) as well.

The short version of the folder structure will not work without the files Unity needs.
If you want to know more about that, read the [setup](../00setup/example.md)

```
+ unity-haxe-helloworld
	+ Source
		- Main.hx
	- build.hxml
```

## The Main.hx

Check out the whole [`Main.hx`](/code/Source/Main.hx) for more details.

That is a lot of code so I will focus on the specific part that writes the file.



```haxe
	function Start() {
		trace("Reading and writing example");

		var dataFileName:String = "hello.txt";
		var filePath = Path.join([Application.streamingAssetsPath, dataFileName]);

		// check if this folder exists, if not create!
		if(!FileSystem.exists(Application.streamingAssetsPath)){
			FileSystem.createDirectory(Application.streamingAssetsPath);
			trace('"StreamAssets"-folder created!');
		}

		var str:String = 'Writing and reading a simple text file.!\nWritten on: ' + Date.now().toString();
		File.saveContent(filePath, str);
		trace('${filePath} is generated');

		// read the file
		var content = File.getContent(filePath);
		trace (content);
	}
```


Most code is from the previous (writing) example, so what is new here?

```haxe
// read the file
var content = File.getContent(filePath);
trace (content);
```

Just that simple to read a file.


## The Haxe build file, build.hxml

You will need a build file (read more about that in the [build example](../09build/example.md)).
I work on osx, so you might need to tweak this script for your os


```bash
-cp Source
-D net-ver=40
# -net-lib C:\Program Files (x86)\Unity\Editor\Data\Managed\UnityEngine.dll
# -net-lib /Applications/Unity/Unity.app/Contents/Managed/UnityEngine.dll
-net-lib /Applications/Unity/Hub/Editor/2018.3.12f1/Unity.app/Contents/Managed/UnityEngine.dll
-cs Assets/Code
-D no-compilation
-D real-position
Main
```



## Build the code

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter



