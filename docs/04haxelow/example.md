# Example

Write to a simple json database...
Done in Haxe


## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ bin
	+ src
		- Main.hx
	- javascript.hxml
```


## Install

Check out [the installation](installation.md).


## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.


```
package ;

import js.Node;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main
{
	function new()
	{
		trace("Node.js Haxelow Example");

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


## The Haxe build file, javascript.hxml

Copy and past the following lines in a document named `javascript.hxml`
This is the short version, you want to chech out the full version open this [file](/code/javascript.hxml);

```
# // javascript.hxml
-lib js-kit
-lib hxnodejs
-lib haxelow
-cp src
-main Main
-js bin/example.js
-cmd node bin/example.js
```



## Build js with Haxe and start Node

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `javascript.hxml`
3. type `haxe javascript.hxml`
4. press enter


