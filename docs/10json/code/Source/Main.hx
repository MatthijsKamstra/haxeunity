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
		trace('Json example');

		var fileName:String = "users.json";
		var filePath = Path.join([Application.streamingAssetsPath, fileName]);

		// folder should exists because it has contains our user.json data file
		if (FileSystem.exists(filePath)) {
			var str:String = File.getContent(filePath);
			var json:Array<User> = haxe.Json.parse(str);
			// trace ("number of users: " + json.length);
			createList(json);
		} else {
			trace('ERROR: there is not file: $filePath');
		}
	}

	private function createList(json:Array<User>):Void {
		var csv = '\n';
		csv += 'id\tname\tusername\temail\tphone\twebsite\n';
		for (i in 0...json.length) {
			var _user:User = json[i];
			csv += '${_user.id}\t';
			csv += '${_user.name}\t';
			csv += '${_user.username}\t';
			csv += '${_user.email}\t';
			csv += '${_user.phone}\t';
			csv += '${_user.website}\t';
			csv += '\n';
		}
		csv += '\n';
		trace(csv);
	}

	static public function main() {
		var main = new Main();
	}
}

typedef User = {
	var id:Int; // 1,
	var name:String; // Leanne Graham",
	var username:String; // Bret",
	var email:String; // Sincere@april.biz",
	var address:{
		var street:String; // Kulas Light",
		var suite:String; // Apt. 556",
		var city:String; // Gwenborough",
		var zipcode:String; // 92998-3874",
		var geo:{
			var lat:String; //-37.3159",
			var lng:String; // 81.1496"
		};
	};
	var phone:String; // 1-770-736-8031 x56442",
	var website:String; // hildegard.org",
	var company:{
		var name:String; // Romaguera-Crona",
		var catchPhrase:String; // Multi-layered client-server neural-net",
		var bs:String; // harness real-time e-markets"
	};
}
