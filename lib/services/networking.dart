import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app/models/WeatherResponseModel.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});
  // List<WeatherResponse> weatherModel = [];

  String cityName;

  Future<WeatherResponseModel> getWeatherResponse() async {
    try {
      Response response = await get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        dynamic weatherModel;
        var jsonString = response.body;
        var jsonDecoded = await json.decode(jsonString);
        weatherModel = WeatherResponseModel.fromJson(jsonDecoded);
        return weatherModel;
      } else {
        print("Error:${response.statusCode}");
      }
    } catch (e) {
      print("Error NetworkHelper: $e");
    }
  }
}
