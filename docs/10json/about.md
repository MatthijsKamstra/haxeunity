# About loading a json

A very common way of loading data in your web-app is the use of `json` files.

Haxe can handle [json](http://api.haxe.org/haxe/Json.html) cross-platform 

> Crossplatform JSON API : it will automatically use the optimized native API if available.
> Use `-D haxeJSON` to force usage of the Haxe implementation even if a native API is found. This will provide extra encoding features such as enums (replaced by their index) and StringMaps.

Some more information about json can be found on the classic <http://www.w3schools.com/json/>

> JSON: JavaScript Object Notation.

> JSON is a syntax for storing and exchanging data.

> JSON is an easier-to-use alternative to XML.

## What is JSON?

- JSON stands for JavaScript Object Notation
- JSON is a lightweight data-interchange format
- JSON is language independent *
- JSON is "self-describing" and easy to understand

## JSON Values

JSON values can be:

* A number (integer or floating point)
* A string (in double quotes)
* A Boolean (true or false)
* An array (in square brackets)
* An object (in curly braces)
* A null


```
{
	"number" : 0,
	"string" : "foobar",
	"bool" : true,
	"array" : ["one","two"],
	"object" : {
		"firstName":"John", 
		"lastName":"Doe"
	},
	"null" : null
}


```
