import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_city_response_model.dart';
import 'package:weather_app/models/weather_response_model.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utils/api_endpoints.dart';

class WeatherApi {
  Future getCityLocationWeather({String cityName, String countryCode}) async {
    NetworkHelper networkHelper = new NetworkHelper(
      url:
          "$baseUrl?city=$cityName&country=$countryCode&days=$totalForcastDays&key=$apiKey",
    );

    WeatherCityResponseModel weatherData =
        await networkHelper.getCityWeatherResponse();
    return weatherData;
  }

  Future getGeoLocationWeather() async {
    print("Weather api: getLocationData");
    Location location = Location();
    await location.getGeoLocation();

    NetworkHelper networkHelper = new NetworkHelper(
      url:
          "$baseUrl?lat=${location.latitude}&lon=${location.longitude}&days=$totalForcastDays&key=$apiKey",
    );

    WeatherResponseModel weatherData = await networkHelper.getWeatherResponse();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
