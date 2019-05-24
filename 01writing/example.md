# Example

Simply write to a file.
Example is from [nodejitsu.com/](https://docs.nodejitsu.com/articles/file-system/how-to-write-files-in-nodejs)


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


## Pure node example

```
fs = require('fs');
fs.writeFile('helloworld.txt', 'Hello World!', function (err) {
	if (err) return console.log(err);
	console.log('Hello World > helloworld.txt');
});
```


## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.

*With the current externs it's not possible to recreate example above, but we can something simular*

```
package ;

import js.Node;
import js.node.Fs;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main
{
	function new()
	{
		trace("Node.js writing Example");

		var str : String = 'Hello World!\nWritten on: ' + Date.now().toString();
		// this code example is closest to the pure node.js example
		Fs.writeFile('hello.txt', str, {}, function (err){
			if (err != null)
				trace( "err: " + err );
			else
				trace('Hello > hello.txt');
		});
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


