import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app/models/weather_city_response_model.dart';
import 'package:weather_app/models/weather_response_model.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future<WeatherResponseModel> getWeatherResponse() async {
    try {
      Response response = await get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        print("IF NetworkHelper: ${response.statusCode}");
        WeatherResponseModel weatherModel;
        var jsonString = response.body;
        print("Json String: $jsonString");
        var jsonDecoded = await json.decode(jsonString);
        weatherModel = WeatherResponseModel.fromJson(jsonDecoded);
        print(weatherModel);
        return weatherModel;
      } else {
        print("IF NetworkHelper: ");
        print("Error:${response.statusCode.toString()}");
      }
    } catch (e) {
      print("Error NetworkHelper: $e");
    }
  }
  Future<WeatherCityResponseModel> getCityWeatherResponse() async {
    try {
      Response response = await get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        print("IF NetworkHelper: ${response.statusCode}");
        WeatherCityResponseModel weatherModel;
        var jsonString = response.body;
        print("Json String: $jsonString");
        var jsonDecoded = await json.decode(jsonString);
        weatherModel = WeatherCityResponseModel.fromJson(jsonDecoded);
        print(weatherModel);
        return weatherModel;
      } else {
        print("IF NetworkHelper: ");
        print("Error:${response.statusCode.toString()}");
      }
    } catch (e) {
      print("Error NetworkHelper: $e");
    }
  }
}
