import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_tracker/weatherModel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=b3a0496afcd54cf7ac3140922232806&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
