package;


/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	function new() {
		// for some reason https doesn't work with c#
		// getUrl('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=${getCurrentDate()}', false);

		var url = 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=${getCurrentDate()}';



		untyped __cs__ ('HttpClient httpClient = new System.Net.HttpClient()');
        var result = untyped __cs__ ('httpClient.GetAsync({0}).Result', url);


        trace(result);

	}

	function getUrl(url:String, isPost:Bool = false):Void {
		var req = new haxe.Http(url);

		req.onData = function(data:String) {
			try {
				var json:NasaData = haxe.Json.parse(data);
				showImage(json);
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
	}

	function showImage(data:NasaData) {
		trace('<img src="${data.hdurl}" alt="${data.title}">');
	}

	function getCurrentDate():String {
		var date = Date.now();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		return year + "-" + StringTools.lpad(Std.string(month), "0", 2) + "-" + StringTools.lpad(Std.string(day), "0", 2);
	}

	static public function main():Void {
		var main = new Main();
	}
}

typedef NasaData = {
	var date:String; // 2016-04-06,
	var explanation:String; // Jupiter has auroras. Like near the Earth, the magnetic field of our Solar System's largest planet compresses when impacted by a gust of charged particles from the Sun. This magnetic compression funnels charged particles towards Jupiter's poles and down into the atmosphere. There, electrons are temporarily excited or knocked away from atmospheric gases, after which, when de-exciting or recombining with atmospheric ions, auroral light is emitted. The featured illustration portrays the magnificent magnetosphere around Jupiter in action. In the inset image released last month, the Earth-orbiting Chandra X-ray Observatory shows unexpectedly powerful X-ray light emitted by Jovian auroras, depicted in false-colored purple. That Chandra inset is superposed over an optical image taken at a different time by the Hubble Space Telescope. This aurora on Jupiter was seen in October 2011, several days after the Sun emitted a powerful Coronal Mass Ejection (CME).,
	var hdurl:String; // http://apod.nasa.gov/apod/image/1604/JupiterMagnetosphere_JAXA_3500.jpg,
	var media_type:String; // image,
	var service_version:String; // v1,
	var title:String; // Auroras and the Magnetosphere of Jupiter,
	var url:String; // http://apod.nasa.gov/apod/i
}
