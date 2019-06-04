# Example json

I have created the [user.json](https://github.com/MatthijsKamstra/haxeunity/tree/master/08json/code/Assets/StreamingAssets/users.json) with <http://jsonplaceholder.typicode.com/users>.


Check the [code folder](https://github.com/MatthijsKamstra/haxeunity/tree/master/08json/code) for more comments.

In this example we are going to read and use a `.json` file.

The short version of the folder structure will not work without the files Unity needs.
If you want to know more about that, read the [setup](../00setup/example.md)

```
+ unity-haxe-helloworld
	+ Assets
		+ StreamingAssets
			- users.json
	+ Source
		- Main.hx
	- build.hxml
```

## The Main.hx

Check out the whole [`Main.hx`](/code/Source/Main.hx) for more details.

That is a lot of code so I will focus on the specific part that writes the file.


```haxe
	function Awake() {
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
```

convert data (String) to a `json` file:
<http://api.haxe.org/haxe/Json.html>

```haxe
var str:String = File.getContent(filePath);
var json:Array<User> = haxe.Json.parse(str);
```

To make that easier I use [`typedef`](http://haxe.org/manual/type-system-typedef.html)

We convert the json data to `User` so when we use a IDE it will use autocompletion

```haxe
typedef User = {
	var id : Int; // 1
	var name : String; // Leanne Graham
	var username : String; // Bret
	var email : String; // Sincere@april.biz
	var address : {
	  	var street : String; // Kulas Light
	  	var suite : String; // Apt. 556
	  	var city : String; // Gwenborough
	  	var zipcode : String; // 92998-3874
	  	var geo : {
	    	var lat : String; // -37.3159
	    	var lng : String; // 81.1496
	      };
	};
	var phone : String; // 1-770-736-8031 x56442
	var website : String; // hildegard.org
	var company : {
	  	var name : String; // Romaguera-Crona
	  	var catchPhrase : String; // Multi-layered client-server neural-net
	  	var bs : String; // harness real-time e-markets
    };
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


```bash
-cp Source
-D net-ver=40
# -net-lib C:\Program Files (x86)\Unity\Editor\Data\Managed\UnityEngine.dll
# -net-lib /Applications/Unity/Unity.app/Contents/Managed/UnityEngine.dll
-net-lib /Applications/Unity/Hub/Editor/2018.3.12f1/Unity.app/Contents/Managed/UnityEngine.dll
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



