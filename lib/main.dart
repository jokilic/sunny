import 'package:flutter/material.dart';

import 'colors.dart';
import 'strings.dart';

import './screens/loading/loading_screen.dart';
import './screens/weather/weather_screen.dart';
import './screens/choose_city/choose_city_screen.dart';

void main() => runApp(Sunny());

class Sunny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context) => LoadingScreen(),
        WeatherScreen.routeName: (context) => WeatherScreen(),
        ChooseCityScreen.routeName: (context) => ChooseCityScreen(),
      },
      title: appName,
      theme: ThemeData(
        primaryColor: currentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: textColor,
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
