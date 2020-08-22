import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

import '../../colors.dart';
import '../weather/weather_screen.dart';
import '../../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading-screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await Weather().getLocationWeather();
    var locationName = await Weather().getLocationName();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            locationWeather: weatherData,
            cityName: locationName[0],
            countryName: locationName[1],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: currentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Dobrodošli u Sunny',
              style: Theme.of(context).textTheme.headline1,
            ),
            Loading(
              indicator: BallPulseIndicator(),
              color: Colors.white,
            ),
            Text(
              'Pričekajte trenutak',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
