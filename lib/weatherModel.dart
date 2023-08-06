class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var feels_like;
  var gust;
  var uv;
  var pressure;
  var precipi;
  var last_update;
  //var localTime;

  Weather({
    required this.cityName,
    required this.icon, 
    required this.condition, 
    required this.temp, 
    required this.wind, 
    required this.humidity, 
    required this.feels_like,
    required this.gust,
    required this.uv,
    required this.pressure,
    required this.precipi,
    required this.last_update});

    Weather.fromJson(Map<String, dynamic> json){
      cityName = json['location']['name'];
      icon = json['current']['condition']['icon'];
      condition = json['current']['condition']['text'];
      temp = json['current']['temp_c'];
      wind = json['current']['wind_kph'];
      humidity = json['current']['humidity'];
      feels_like = json['current']['feelslike_c'];
      gust = json['current']['gust_kph'];
      uv = json['current']['uv'];
      pressure = json['current']['pressure_mb'];
      precipi = json['current']['precip_mm'];
      last_update = json['current']['last_updated'];
      //localTime = json[''];
    }
}

