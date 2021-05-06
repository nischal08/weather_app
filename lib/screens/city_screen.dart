import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/city_screen_controller.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  static const routeName = "/search";

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  CityScreenController _cityScreenController;

  TextEditingController _cityNameTextController;
  String countryCode;

  @override
  Widget build(BuildContext context) {
    _cityScreenController = Provider.of<CityScreenController>(context);
    _cityNameTextController = TextEditingController();
    return Scaffold(
      body: _cityScreenController.isLoading
          ? _circularSpinner(context)
          : _body(context),
    );
  }

  Center _circularSpinner(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: Theme.of(context).primaryColor,
        size: 100.0,
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/city_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _backBtn(context),
            _searchTextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Country: ",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  width: 70,
                  height: 60,
                  child: CountryCodePicker(
                    onChanged: (value) {
                 if(value.code.isNotEmpty)  _cityScreenController.setCountryCode(value.code);
                    },
                    // onInit: (value) {
                    //   _cityScreenController.setCountryCode(value.code);
                    // },
                    backgroundColor: Colors.white,
                    hideMainText: true,
                    showFlagMain: true,
                    showFlag: true,
                    initialSelection: 'GT',
                    hideSearch: false,
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                ),
              ],
            ),
            _getWeatherBtn(context),
          ],
        ),
      ),
    );
  }

  TextButton _getWeatherBtn(context) {
    return TextButton(
      onPressed: () {
        debugPrint(_cityNameTextController.text);
        _cityScreenController.onClickgetWeather(
         
          cityName: _cityNameTextController.text.trim(),
          context: context,
        );
      },
      child: Text(
        'Get Weather',
        style: kButtonTextStyle,
      ),
    );
  }

  Container _searchTextField() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        controller: _cityNameTextController,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: kTextFieldInputDecoration,
      ),
    );
  }

  Row _backBtn(context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: () {
              _cityScreenController.onClickBackBtn(
                context: context,
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 50.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
