import 'package:flutter/widgets.dart';
import 'package:weather_app/services/location.dart';

class WeatherController extends ChangeNotifier {
  Future<void> getLocationData({context}) async {
    print("Weather controller: getLocationData");
    await Location().getLocation(context: context);
    print(Location().latitude.toString() + "\n");
    print(Location().longitude.toString() + "\n");
    Navigator.pushNamed(context, '/home');
  }
}
