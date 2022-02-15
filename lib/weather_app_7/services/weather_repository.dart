import 'dart:convert';

import 'package:flutter_bloc_ejemplos/weather_app_7/models/weather.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/services/weather_api_provider.dart';
import 'package:http/http.dart' as http;

 class WeatherRepository {
  
  final WeatherDataProvider weatherDataProvider = WeatherDataProvider();

  Future<Weather> getWeather(String location) async {
   final http.Response rawWeather = await weatherDataProvider.getRawWeatherData(location);
   final json = await jsonDecode(rawWeather.body);
   final Weather weather = Weather.fromJson(json);
   return weather;
  }
}