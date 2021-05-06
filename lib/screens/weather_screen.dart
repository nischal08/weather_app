import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/widgets/icon_with_text_row.dart';

class WeatherScreen extends StatelessWidget {
  static const routeName = '/home';
  var weatherModel;
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    weatherModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: null,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
              image: AssetImage(
                'images/location_background.jpg',
              ),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MediaQuery.of(context).size.height < 790
                ? _upperWeatherDetailSmallHeightDevice(context)
                : _upperWeatherDetailBigHeightDevice(context),
            _lowerWeatherDetail(context),
          ],
        ),
      ),
    );
  }

  SafeArea _upperWeatherDetailSmallHeightDevice(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height * 0.62 -
            MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 130,
              // ),
              _customAppbar(context),
              SizedBox(
                height: 10,
              ),
              _weatherConditionIconWithText(context),
              SizedBox(
                height: 10,
              ),
              _weatherDegree(context),
              SizedBox(
                height: 10,
              ),
              weatherDetailInfo(context),
              SizedBox(
                height: 10,
              ),
              _helpNote(context),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _upperWeatherDetailBigHeightDevice(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height * 0.62 -
            MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _customAppbar(context),
            SizedBox(
              height: 20,
            ),
            _weatherConditionIconWithText(context),
            SizedBox(
              height: 20,
            ),
            _weatherDegree(context),
            SizedBox(
              height: 20,
            ),
            weatherDetailInfo(context),
            SizedBox(
              height: 20,
            ),
            _helpNote(context),
          ],
        ),
      ),
    );
  }

  Widget _lowerWeatherDetail(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurple,
            Colors.blueGrey.shade900,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(20),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          _weeksWeatherForcastText(context),
          _weeksWeatherForcast(context),
        ],
      ),
    );
  }

  Container _weeksWeatherForcast(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32 - 5,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: weatherModel.data.length,
          itemBuilder: (context, index) {
            return _dayWeatherInfo(
                context: context,
                dayLabel: DateFormat.MMMMEEEEd()
                    .format(weatherModel.data[index].datetime),
                iconText: WeatherApi().getWeatherIcon(
                  weatherModel.data[index].weather.code,
                ),
                highTemp: weatherModel.data[index].appMaxTemp,
                lowTemp: weatherModel.data[index].appMinTemp);
          },
        ),
      ),
    );
  }

  Container _weeksWeatherForcastText(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Weeks Weather Forcast",
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _dayWeatherInfo({context, dayLabel, highTemp, lowTemp, iconText}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              dayLabel,
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.white.withOpacity(0.85),
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(iconText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
          ),
          Expanded(flex: 2, child: _tempRow(highTemp, context, lowTemp))
        ],
      ),
    );
  }

  Row _tempRow(highTemp, context, lowTemp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            "$highTemp°",
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          "$lowTemp°",
          style: Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _helpNote(BuildContext context) {
    return Container(
        child: Text(
      WeatherApi().getMessage(
        weatherModel.data.first.temp.toInt(),
      ),
      textAlign: TextAlign.left,
      style: MediaQuery.of(context).size.height < 790
          ? Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400)
          : Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
    ));
  }

  Container weatherDetailInfo(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconWithTextRow(
            icon: Icons.speed_outlined,
            label: "${weatherModel.data.first.windSpd.toInt().toString()}km/h",
          ),
          IconWithTextRow(
            icon: Icons.explore_outlined,
            label: "${weatherModel.data.first.windCdir}",
          ),
          IconWithTextRow(
            icon: Icons.report_gmailerrorred_outlined,
            label: "${weatherModel.data.first.uv.toStringAsFixed(2)}nm",
          ),
        ],
      ),
    );
  }

  Widget _weatherDegree(context) {
    return Text(
      "${weatherModel.data.first.temp}°C",
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
    );
  }

  Column _weatherConditionIconWithText(context) {
    return Column(
      children: [
        Text(
          WeatherApi()
              .getWeatherIcon(weatherModel.data.first.weather.code.toInt()),
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height < 790 ? 70 : 90),
        ),
        SizedBox(
          height: 10,
        ),
        Chip(
          elevation: 4,
          backgroundColor: Theme.of(context).primaryColor,
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
            child: Text(
              weatherModel.data.first.weather.description,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }

  Row _customAppbar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: Icon(
              Icons.near_me,
              color: Colors.white,
            )),
        Container(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              _locationText(context),
              SizedBox(
                height: 5,
              ),
              _locationInfo(context)
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/search");
          },
          child: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Text _locationInfo(context) {
    return Text(
        "${weatherModel.cityName}, ${weatherModel.stateCode}, ${weatherModel.countryCode}",
        style: MediaQuery.of(context).size.height < 790
            ? Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                )
            : Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ));
  }

  Row _locationText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.my_location,
          color: Colors.white70,
          size: MediaQuery.of(context).size.height < 790 ? 16 : 20,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Your Location Now",
          style: Theme.of(context).textTheme.caption.copyWith(
                color: Colors.white70,
                fontSize: MediaQuery.of(context).size.height < 790 ? 14 : 16,
              ),
        ),
      ],
    );
  }
}
