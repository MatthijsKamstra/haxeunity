package;

import haxe.io.*;
import haxe.io.Path;
import sys.io.File;
import sys.FileSystem;

import unityengine.*;
import unityengine.Application;

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
		trace('Writing example');

		var dataFileName:String = "hello.txt";
		var filePath = Path.join([Application.streamingAssetsPath, dataFileName]);

		// check if this folder exists, if not create!
		if(!FileSystem.exists(Application.streamingAssetsPath)){
			FileSystem.createDirectory(Application.streamingAssetsPath);
			trace('"StreamAssets"-folder created!');
		}

		var str:String = 'Hello World!\nWritten on: ' + Date.now().toString();
		File.saveContent(filePath, str);

		trace('${filePath} is generated');
	}

	static public function main() {
		var main = new Main();
	}
}
