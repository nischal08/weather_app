import 'package:flutter/widgets.dart';
import 'package:weather_app/models/WeatherResponseModel.dart';
import 'package:weather_app/services/weather_api.dart';

class WeatherController extends ChangeNotifier {
  WeatherResponseModel weatherData;
  Future<void> getLocationData({context}) async {
    weatherData = await WeatherApi().getLocationWeather();
    Navigator.pushNamed(context, '/home', arguments: weatherData);
  }

 
}
