//			 날씨 API js code / 5-10 / 송지웅 

$(document).ready(function(){

	//날씨 api JSON
	let url = "";

	today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var standardDate = year + month + day;
	var selectDate = standardDate;

	url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?service" +
		"Key=0F6dEQGTpufQ3xwgPyIGkfg981BnlV0PLYsV%2BLOlurJf5xxYt8jQ%2BLS6QqWImN1ku74pnZuFB7SJoXusZurEOA%3D%3D&pageNo=1&numOfRows=1000&" +
		"dataType=JSON&base_date=" + standardDate + "&base_time=0500&nx=55&ny=127";
	$.getJSON(url, function(data) {
		let weatherData = data.response.body.items.item;
		let iconCount = 0;
		let tempCount = -1;
		let rainCount = -1;
		let windCount = -1;
		for(list of weatherData) {
			iconCount++;
			if(list.category == "SKY" && list.fcstTime == "1200") {
				if(list.fcstDate == selectDate) {
					var weatherIconData = (weatherData[iconCount].fcstValue);
				}
			}
		}
		for(list of weatherData) {
			tempCount++;
			if(list.category == "TMP" && list.fcstTime == "1200") {
				if(list.fcstDate == selectDate){
					var weatherTempData = (weatherData[tempCount].fcstValue);
				}
			}
		}
		for(list of weatherData) {
			rainCount++;
			if(list.category == "PTY" && list.fcstTime == "1200") {
				if(list.fcstDate == selectDate){
					var weatherRainData = (weatherData[rainCount].fcstValue);
				}
			}
		}
		for(list of weatherData) {
			windCount++;
			if(list.category == "WSD" && list.fcstTime == "1200") {
				if(list.fcstDate == selectDate){
					var weatherWindData = (weatherData[windCount].fcstValue);
				}
			}
		}
		if(weatherIconData == "0" || weatherIconData == "2") { //먼저 짜보고 하자
			var weatherOutput = "<div id='weather_img'><img src='http://localhost:9000/images/sun.png'></div>";
		}else if(weatherIconData == "1") {
			var weatherOutput = "<div id='weather_img'><img src='http://localhost:9000/images/cloud.png'></div>";
		}else if(weathetIconData == "3") {
			var weathetOutput = "<div id='weather_img'><img src='http://localhost:9000/images/cloud.png'></div>"
		}else if(weathetIconData == "4") {
			var weatherOutput = "<div id='weather_img'><img src='http://localhost:9000/images/rain.png'></div>";
		}
		if(weatherRainData == "0") {
			var weatherRainMessage = "맑음";
		}else if(weatherRainData == "1") {
			var weatherRainMessage = "비";
		}else if(weatherRainData == "2") {
			var weatherRainMessage = "비/눈";
		}else if(weatherRainData == "3") {
			var weatherRainMessage = "눈";
		}else if(weatherRainData == "4") {
			var weatherRainMessage = "소나기";
		}
		weatherOutput += "<div id='weather_info'>";
		weatherOutput += "<ul>";
		weatherOutput += "<li>"+weatherTempData+"℃</li>";
		weatherOutput += "<li>"+weatherRainMessage+"</li>";
		weatherOutput += "<li>풍속 : "+weatherWindData+"m/s</li>";
		weatherOutput += "</ul>";
		weatherOutput += "</div>";

		$("#weather_icon").append(weatherOutput);
	});



	
	$(".btn_weather_date").click(function(){
		$("div#weather_img").remove();
		$("div#weather_info").remove();
		
		let id = $(this).attr("id");
		today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth()+1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var standardDate = year+month+day;
		if(id == "today") {
			var selectDate = standardDate;
		}else if(id == "tomorrow") {
			today = new Date();
			today.setDate(today.getDate()+1);
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth()+1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var selectDate = year+month+day;
		}else if(id == "after") {
			today = new Date();
			today.setDate(today.getDate()+2);
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth()+1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var selectDate = year+month+day;
		}
		url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?service" +
				"Key=0F6dEQGTpufQ3xwgPyIGkfg981BnlV0PLYsV%2BLOlurJf5xxYt8jQ%2BLS6QqWImN1ku74pnZuFB7SJoXusZurEOA%3D%3D&pageNo=1&numOfRows=1000&" +
				"dataType=JSON&base_date="+standardDate+"&base_time=0500&nx=55&ny=127";
		$.getJSON(url, function(data){
			let weatherData = data.response.body.items.item;
			let iconCount = 0;
			let tempCount = -1;
			let rainCount = -1;
			let windCount = -1;
			for(list of weatherData) {
				iconCount++;
				if(list.category == "SKY" && list.fcstTime == "1200") {
					if(list.fcstDate == selectDate) {
						var weatherIconData = (weatherData[iconCount].fcstValue);
					}
				}
			}
			for(list of weatherData) {
				tempCount++;
				if(list.category == "TMP" && list.fcstTime == "1200") {
					if(list.fcstDate == selectDate){
						var weatherTempData = (weatherData[tempCount].fcstValue);
					}
				}
			}
			for(list of weatherData) {
				rainCount++;
				if(list.category == "PTY" && list.fcstTime == "1200") {
					if(list.fcstDate == selectDate){
						var weatherRainData = (weatherData[rainCount].fcstValue);
					}
				}
			}
			for(list of weatherData) {
				windCount++;
				if(list.category == "WSD" && list.fcstTime == "1200") {
					if(list.fcstDate == selectDate){
						var weatherWindData = (weatherData[windCount].fcstValue);
					}
				}
			}
			if(weatherIconData == "0" || weatherIconData == "2") { //먼저 짜보고 하자 
				var weatherOutput = "<div id='weather_img'><img src='http://localhost:9000/images/sun.png'></div>";
			}else if(weatherIconData == "1") {
				var weatherOutput = "<div id='weather_img'><img src='http://localhost:9000/images/cloud.png'></div>";
			}else if(weathetIconData == "3") {
				var weathetOutput = "<div id='weather_img'><img src='http://localhost:9000/images/cloud.png'></div>"
			}else if(weathetIconData == "4") {
				var weatherOutput = "<div id='weather_img'><img src='http://localhost:9000/images/rain.png'></div>";
			}
			if(weatherRainData == "0") {
				var weatherRainMessage = "맑음";
			}else if(weatherRainData == "1") {
				var weatherRainMessage = "비";
			}else if(weatherRainData == "2") {
				var weatherRainMessage = "비/눈";
			}else if(weatherRainData == "3") {
				var weatherRainMessage = "눈";
			}else if(weatherRainData == "4") {
				var weatherRainMessage = "소나기";
			}
				weatherOutput += "<div id='weather_info'>";
				weatherOutput += "<ul>";
				weatherOutput += "<li>"+weatherTempData+"℃</li>";
				weatherOutput += "<li>"+weatherRainMessage+"</li>";
				weatherOutput += "<li>풍속 : "+weatherWindData+"m/s</li>";
				weatherOutput += "</ul>";
				weatherOutput += "</div>";
					
				$("#weather_icon").append(weatherOutput);
		}); //getJSON 
		
	});
	/*let url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/" +
	"getVilageFcst?serviceKey=0F6dEQGTpufQ3xwgPyIGkfg981BnlV0PLYsV%2BLOlurJf5xxYt8jQ%2BLS6QqWImN1ku74pnZuFB7SJoXusZurEOA%3D%3D&pageNo=1" +
	"&numOfRows=1000&dataType=JSON&base_date="+weatherData+"&base_time=0500&nx=55&ny=127"
	*/
});
