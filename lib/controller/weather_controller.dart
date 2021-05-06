import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_response_model.dart';
import 'package:weather_app/services/weather_api.dart';

class WeatherController extends ChangeNotifier {
  WeatherResponseModel weatherData;
  Future<void> getGeoLocationData({context}) async {
    weatherData = await WeatherApi().getGeoLocationWeather();
    if(weatherData!=null) Navigator.pushNamed(context, '/home', arguments: weatherData);
  }

 
}
