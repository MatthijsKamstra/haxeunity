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
			var color = '#ff3333';
			if (infos.customParams != null && infos.customParams.length > 0) {
				// Debug.Log(infos.customParams[0]);
				color = infos.customParams[0];
			}
			var str = '<color=${color}>${infos.fileName}:${infos.lineNumber}:</color> <b>${v}</b>';
			Debug.Log(str);
		}
		// trace("hello green", 'green');
		// trace("hello red", 'red');
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
