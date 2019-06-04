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
		// write your own trace function suitable for Unity
		haxe.Log.trace = function(v:Dynamic, ?infos:haxe.PosInfos) {
			var str = '<color=#ff3333>${infos.fileName}:${infos.lineNumber}:</color> <b>${v}</b>';
			Debug.Log(str);
		}
	}

	function Awake() {
		trace("Haxelow Example");

		var fileName:String = "db.json";
		var filePath = Path.join([Application.streamingAssetsPath, fileName]);

		// Create the database
		var db = new HaxeLow(filePath);

		// Get a collection of a class
		var persons = db.col(Person);

		trace('Total persons in db: ${persons.length}');

		// persons is now an Array<Person>
		// that can be manipulated as you like
		persons.push(new Person(randomName(), randomInteger(1900,2019)));

		// Save all collections to disk.
		// This is the only way to save, no automatic saving
		// takes place.
		db.save();

		trace('Open ${filePath}');

		createList(persons);
	}

	private function createList(arr:Array<Person>):Void {
		var csv = '\n';
		csv += 'id\tname\tbirth\n';
		for (i in 0...arr.length) {
			var _p:Person = arr[i];
			csv += '${_p.id}\t';
			csv += '${_p.name}\t';
			csv += '${_p.birth}\t';
			csv += '\n';
		}
		csv += '\n';
		trace(csv);
	}

	function randomName ():String{
		var medeklinker = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z', 'ch', 'sj', 'th' ];
		var klinker = ['a', 'e', 'i', 'o', 'u' , 'aa', 'oe', 'au', 'ui' ];
		var name = medeklinker[randomInteger(medeklinker.length-1)].toUpperCase() + klinker[randomInteger(klinker.length-1)] +medeklinker[randomInteger(medeklinker.length-1)] + klinker[randomInteger(klinker.length-1)];
		return name;
	}

	function randomInteger(min:Int, ?max:Int):Int {
		if (max == null) {
			max = min;
			min = 0;
		}
		return Math.floor(Math.random() * (max + 1 - min)) + min;
	}


	static public function main() {
		var main = new Main();
	}
}

class Person {
	public function new(name, birth) {
		this.name = name; this.birth = birth;
	}

	// Easy way to generate a v4 UUID:
	public var id : String = HaxeLow.uuid();
	public var name : String;
	public var birth : Int;
}

