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
