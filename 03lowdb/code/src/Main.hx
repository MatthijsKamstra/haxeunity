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
		
		var str = Date.now();

		var _lowdb = LowDb.construct('db.json');
		LowDb.query(_lowdb, 'posts').push({title:'lowdb is awesome', date:str});

		trace (LowDb.query(_lowdb, 'posts').find({ title: 'lowdb is awesome' }));

		// _lowdb.save();
		trace ("_lowdb.object: " + _lowdb.object);

	}

	static public function main()
	{
		var main = new Main();
	}
}