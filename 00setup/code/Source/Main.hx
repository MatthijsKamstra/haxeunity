import unityengine.*;

@:nativeGen
class Main extends MonoBehaviour {
	var who:String;

	function Awake() {
		Debug.Log('Hello, $who!');
	}
}
