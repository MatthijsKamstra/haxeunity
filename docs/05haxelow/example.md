# Example Haxelow

Write to a simple json database...
Done in Haxe

Check the [code folder](https://github.com/MatthijsKamstra/haxeunity/tree/master/04haxelow/code) for more comments.

In this example we are going to use a database `.json` file.

The short version of the folder structure will not work without the files Unity needs.
If you want to know more about that, read the [setup](../00setup/example.md)

```
+ unity-haxe-helloworld
	+ Assets
		+ StreamingAssets
	+ Source
		- Main.hx
	- build.hxml
```

This script assumes that the `Assets/StreamingAssets` exists.

You can always add a little check for that if you want.

```haxe
// check if this folder exists, if not create!
if(!FileSystem.exists(Application.streamingAssetsPath)){
	FileSystem.createDirectory(Application.streamingAssetsPath);
	trace('"StreamAssets"-folder created!');
}
```



## Install

Don't forget to install haxelow

```
haxelib install haxelow
```


## The Main.hx

Check out the whole [`Main.hx`](/code/Source/Main.hx) for more details.

That is a lot of code so I will focus on the specific part that writes the file.


```haxe
	function Start() {
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
```


We have created a class for the "user" in the database.
And added an uuid as the id create with ` HaxeLow.uuid()`

```haxe
class Person {
	public function new(name, birth) {
		this.name = name; this.birth = birth;
	}

	// Easy way to generate a v4 UUID:
	public var id : String = HaxeLow.uuid();
	public var name : String;
	public var birth : Int;
}
```


And then it's possible to convert the `json` to usable input:

```haxe
for (i in 0...json.length) {
	var _user:User = json[i];
	trace ( "Name: " + _user.name );
}
```





## The Haxe build file, build.hxml

You will need a build file (read more about that in the [build example](../09build/example.md)).
I work on osx, so you might need to tweak this script for your os

Don't forget to add haxelow lib to this file:


```bash
-lib haxelow
-cp Source
-D net-ver=40
# -net-lib C:\Program Files (x86)\Unity\Editor\Data\Managed\UnityEngine.dll
# -net-lib /Applications/Unity/Unity.app/Contents/Managed/UnityEngine.dll
-net-lib /Applications/Unity/Hub/Editor/2019.2.2f1/Unity.app/Contents/Managed/UnityEngine.dll
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