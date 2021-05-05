import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/screens/loading_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => WeatherController(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        buttonColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xff323332),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30, color: Colors.black),
          headline2: TextStyle(fontSize: 26, color: Colors.black),
          headline3: TextStyle(fontSize: 22, color: Colors.black),
          headline4: TextStyle(fontSize: 20, color: Colors.black),
          headline5: TextStyle(fontSize: 18, color: Colors.black),
          headline6: TextStyle(fontSize: 16, color: Colors.black),
          bodyText1: TextStyle(fontSize: 14, color: Colors.black),
          bodyText2: TextStyle(fontSize: 12, color: Colors.black),
          caption: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        //  primaryColor: Colors.brown,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Theme.of(context).primaryColorLight,
          unselectedItemColor: Theme.of(context).primaryColorLight,
          selectedItemColor: Theme.of(context).primaryColorDark,
        ),
      ),
      initialRoute: LoadingScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context) => LoadingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
