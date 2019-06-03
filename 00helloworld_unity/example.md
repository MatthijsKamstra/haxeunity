# Hello World Example

Check the [code folder](https://github.com/MatthijsKamstra/haxeunity/tree/master/00helloworld/code) for more comments.
If you want to know why we are making this? Check out the [C# helloworld](../00helloworld/about.md).

This example will be a bit diferent from most examples I wrote.

First the file/folder structure will be different, this because C# in combination with Unity dictates it.
Normally I would advise to use this folder structure:

```
+ foobar
	+ bin
	+ src
		- Main.hx
	- build.hxml
```

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

## The Haxe build file, build.hxml update

I will be using the "unity-haxe-helloworld" from Nadako in all examples. But this also means that you need to change something first before you can build.

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

If you work on Windows you should have a path the unity engine:

`-net-lib C:\Program Files (x86)\Unity\Editor\Data\Managed\UnityEngine.dll`

If you work on Osx you should have a path the unity engine:

`-net-lib /Applications/Unity/Unity.app/Contents/Managed/UnityEngine.dll`

I work on osx and I used "Unity Hub" to install Unity my path was:

`-net-lib /Applications/Unity/Hub/Editor/2018.3.12f1/Unity.app/Contents/Managed/UnityEngine.dll`

The only thing I added to the build.hxml is

```
-D real-position
```

This stops the generate `#line` directives that map C# expression positions to original .hx files. Useful for tracking down issues related to code generation. But I hope I will never need this. So lets not generate this lines.



## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.

```haxe
package;

import unityengine.*;

import cs.system.Console;

@:nativeGen
class Main extends MonoBehaviour {
	function Awake() {
		// logging via Haxe
		trace("[Haxe] Hello world before trace rewrite"); // not visible in Unity
		// write your own trace function suitable for Unity
		haxe.Log.trace = function(v:Dynamic, ?infos:haxe.PosInfos) {
			var str = infos.fileName + ":" + infos.lineNumber + ": " + v;
			Debug.Log(str);
		}

		// logging via unity
		Debug.Log('[Unity] Hello world');
		// logging via C#
		Console.WriteLine("[C#] Hello world");
		// logging via Haxe
		trace("[Haxe] Hello world");
	}
}

```

You can see that we use 3 ways of logging in this file

```haxe
	Debug.Log('[Unity] Hello world');
	Console.WriteLine("[C#] Hello world");
	trace("[Haxe] Hello world");
```

Only the first one will show up in Unity (`Debug.Log("")`), the others will not.

But if you want to use the default trace (and the ability to link it back to your original Haxe code & easy removal) in Unity you will need to rewrite the logging a bit:

```haxe
	haxe.Log.trace = function(v:Dynamic, ?infos:haxe.PosInfos) {
		var str = infos.fileName + ":" + infos.lineNumber + ": " + v;
		Debug.Log(str);
	}
```

This way trace will work via the default Log methode.

Read more about this subject: <https://haxe.org/manual/debugging-trace-log.html>

