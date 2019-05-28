# Example Quote

I run into some problems here.
For most sys targets a `https` call works, but not for the C# target.

When I was looking for a solution closer to C# I ran into problems that had to do with the .NET lib you need to install.
Hmmm, and that was the moment that I was no longer looking

There is a solution, but I am not the person to fix it.

To make this example working, I choose a api that doesn't need Authentication and `http`... (again `https` doesn't work)

In this case we will use: <http://forismatic.com/en/api/> an api that hands out quotes.

## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ src
		- Main.hx
	- build.hxml
```

## The Main.hx

Open your favorite editor, copy/paste the code and save it in the `src` folder.
Check the complete [Main.hx](https://github.com/MatthijsKamstra/haxeunity/tree/master/06quote_haxe/code/src/Main.hx).

This is the most interesting part:

```
var req = new haxe.Http('http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en');

req.onData = function(data:String) {
	try {
		var json:ForismaticObj = haxe.Json.parse(data);
		output(json);
	} catch (e:Dynamic) {
		trace(e);
	}
}

req.onError = function(error:String) {
	trace('error: $error');
}

req.onStatus = function(status:Int) {
	trace('status: $status');
}

req.request(isPost); // false=GET, true=POST

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






