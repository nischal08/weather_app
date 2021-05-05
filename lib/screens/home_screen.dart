import 'package:flutter/material.dart';
import 'package:weather_app/models/WeatherResponse.dart';
import 'package:weather_app/services/networking.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final List<WeatherResponse> args =
        ModalRoute.of(context).settings.arguments;
    print("From home_screen" + args[0].appMaxTemp.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
            child: Column(
              children: [
                // Text( NetworkHelper().cityName),
                for (var weatheritem in args)
                  Text(weatheritem.weather.code.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
