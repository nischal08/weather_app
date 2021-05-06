import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_city_response_model.dart';

import 'package:weather_app/services/weather_api.dart';

class CityScreenController extends ChangeNotifier {
  bool isLoading = false;
  void onClickgetWeather({BuildContext context, String cityName}) async {
    isLoading = true;
    notifyListeners();
    WeatherCityResponseModel weatherData;
    debugPrint("CityScreen Controller: $cityName");
    weatherData = await WeatherApi().getCityLocationWeather(cityName: cityName);
    if (weatherData != null)
      Navigator.pushNamed(context, '/home', arguments: weatherData);
 isLoading = false;
    notifyListeners();

  }

  void onClickBackBtn({BuildContext context}) {
    Navigator.pop(context);
  }
}
