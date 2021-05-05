import 'package:weather_app/models/WeatherResponseModel.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utils/api_endpoints.dart';

class WeatherApi {
  Future getLocationWeather() async {
    print("Weather controller: getLocationData");
    Location location = Location();
    await location.getGeoLocation();
    // print("Weather controller: Location Detail:");
    // print(location.latitude.toString() + "\n");
    // print(location.longitude.toString() + "\n");
    NetworkHelper networkHelper = new NetworkHelper(
      url:
          "$baseUrl?lat=${location.latitude}&lon=${location.longitude}&days=$totalForcastDays&key=$apiKey",
    );

    WeatherResponseModel weatherData =
        await networkHelper.getWeatherResponse();
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
