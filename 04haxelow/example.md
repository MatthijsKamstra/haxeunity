# Example

Write to a simple json database...
Done in Haxe


## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ src
		- Main.hx
	- build.hxml
```


## Install

Check out [the installation](installation.md).


## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.


```
package ;

class Main {
	function new() {
		trace("C# Haxelow Example");

		// Create the database
		var db = new HaxeLow('db.json');

		// Get a collection of a class
		var persons = db.col(Person);

		// persons is now an Array<Person>
		// that can be manipulated as you like
		persons.push(new Person("Test", 50));

		// Save all collections to disk.
		// This is the only way to save, no automatic saving
		// takes place.
		db.save();

		trace("open /out/bin/db.json");
	}

	static public function main()
	{
		var main = new Main();
	}
}

class Person {
	public function new(name, age) {
		this.name = name;
		this.age = age;
	}

	public var name : String;
	public var age : Int;
}
```


## The Haxe build file, build.hxml

Copy and past the following lines in a document named `build.hxml`
This is the short version, you want to chech out the full version open this [file](/code/build.hxml);

```
# // build.hxml
-cp src
-main Main
-cs out
-dce full
--next
-cmd cd out/bin
-cmd mono Main.exe
```


## Build C# with Haxe and start export with mono

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter


