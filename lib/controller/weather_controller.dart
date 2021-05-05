import 'package:flutter/widgets.dart';
import 'package:weather_app/models/WeatherResponse.dart';
import 'package:weather_app/services/weather_api.dart';

class WeatherController extends ChangeNotifier {
  List<WeatherResponse> weatherData;
  Future<void> getLocationData({context}) async {
    weatherData = await WeatherApi().getLocationWeather();
    Navigator.pushNamed(context, '/home', arguments: weatherData);
  }

  String _cityName;

  void setCityName(val) {
    _cityName = val;
    notifyListeners();
  }
  String getCityName() {
    return _cityName;
   
  }
}
