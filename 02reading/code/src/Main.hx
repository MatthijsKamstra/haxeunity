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
		trace("Node.js reading and writing Example");
		
		var str = Date.now().toString();

		// write the file
		Fs.writeFile('hello.txt', str, {}, function (err){
			if (err != null) 
				trace( "err: " + err );
			else
				trace('Hello > hello.txt');
		});

		// read the file
		Fs.readFile('hello.txt', function (err,data){
			if(err != null)
				trace( "err: " + err );
			else
				trace( "data: " + data );
		});

	}

	static public function main()
	{
		var main = new Main();
	}
}