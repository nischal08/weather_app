import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/';
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // WeatherController _weatherStateController;
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherController>(context, listen: false)
        .getGeoLocationData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    // _weatherStateController = Provider.of<WeatherController>(context);
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Theme.of(context).primaryColor,
          size: 100.0,
        ),
      ),
    );
  }
}
