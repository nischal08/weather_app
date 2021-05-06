import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_city_response_model.dart';

import 'package:weather_app/services/weather_api.dart';

class CityScreenController extends ChangeNotifier {
  bool isLoading = false;
  String countryCode="US";
  void setCountryCode(String val) {
    countryCode = val;
    notifyListeners();
  }

  void onClickgetWeather(
      {BuildContext context, String cityName}) async {
    isLoading = true;
    notifyListeners();
    WeatherCityResponseModel weatherData;
    debugPrint("CityScreen Controller: $cityName");
    debugPrint("CityScreen Controller: $countryCode");
    weatherData = await WeatherApi()
        .getCityLocationWeather(cityName: cityName, countryCode: this.countryCode);
    if (weatherData != null)
      Navigator.pushNamed(context, '/home', arguments: weatherData);
    isLoading = false;
    notifyListeners();
  }

  void onClickBackBtn({BuildContext context}) {
    Navigator.pop(context);
  }
}
