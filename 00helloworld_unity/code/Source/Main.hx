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

	static public function main() {
		var main = new Main();
	}
}
