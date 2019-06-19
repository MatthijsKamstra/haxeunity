package view;

import unityengine.MonoBehaviour;

@:nativeGen
@:keep
class HideWhenPlaying extends MonoBehaviour {
	function Awake() {
		gameObject.SetActive(false);
	}
}