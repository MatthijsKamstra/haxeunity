# Example

Simply write to a file.
Example is from [nodejitsu.com/](https://docs.nodejitsu.com/articles/file-system/how-to-read-files-in-nodejs)


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

check out [the installation](installation.md).


## Node.js example

```
var low = require('lowdb')
var db = low('db.json')

db('posts').push({ title: 'lowdb is awesome'})
```


## The Main.hx



It's not always possible to have the exact same calls in Haxe externs like you have in javascript/node.js.

Lowdb is a good example:

```
var db = low('db.json')
// translates in Haxe externs to
var db = LowDb.construct('db.json');
```

and

```
db('posts').push({ title: 'lowdb is awesome'})
// translates in Haxe externs to
LowDb.query(_lowdb, 'posts').push({title:'lowdb is awesome'});
```

and

```
db('posts').find({ title: 'lowdb is awesome' })
// translates in Haxe externs to
trace (LowDb.query(_lowdb, 'posts').find({ title: 'lowdb is awesome' }));
```

Knowing that I hope the code below will make more sense.
Open your favorite editor, copy/paste the code and save it in the `src` folder.



```
package ;

import js.Node;
import js.npm.LowDb;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main
{
	function new()
	{
		trace("Node.js LowDB Example");

		var _lowdb = LowDb.construct('db.json');
		LowDb.query(_lowdb, 'posts').push({title:'lowdb is awesome'});

		trace ("_lowdb.object: " + _lowdb.object);
	}

	static public function main()
	{
		var main = new Main();
	}
}

```


## The Haxe build file, javascript.hxml

Copy and past the following lines in a document named `javascript.hxml`
This is the short version, you want to chech out the full version open this [file](/code/javascript.hxml);

```
# // javascript.hxml
-lib js-kit
-lib hxnodejs
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


