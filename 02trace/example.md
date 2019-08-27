# trace example

Loggin is somewhat different in Unity.
Normally you would use `trace` for logging in Haxe.
But the unity target uses a different Logging system, so the normal trace doesn't show up in Unity.

The example is going to fix that.


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


```
package;

import unityengine.*;

import cs.system.Console;

@:nativeGen
class Main extends MonoBehaviour {

	function new (){
		super();
	}

	function Awake() {
		// write your own trace function suitable for Unity
		haxe.Log.trace = function(v:Dynamic, ?infos:haxe.PosInfos) {
			var str = infos.fileName + ":" + infos.lineNumber + ": " + v;
			Debug.Log(str);
		}
	}

	function Start() {
		// logging via unity
		Debug.Log('[Unity] Hello world');
		// logging via C#
		Console.WriteLine("[C#] Hello world");
		// logging via Haxe
		trace("[Haxe] Hello world");
	}

	static public function main() {
		var main = new Main();
	}
}

```


You can see (in the Start function) that we use 3 ways of logging in this file

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


