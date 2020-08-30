import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

import '../../colors.dart';
import '../../strings.dart';
import '../weather/weather_screen.dart';
import '../../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading-screen';

  void getLocationData(BuildContext context) async {
    var weatherData = await Weather().getLocationWeather();
    var locationName = await Weather().getLocationName();
    var timezoneData = await Weather().getLocationTimezone();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            locationWeather: weatherData,
            timezoneData: timezoneData,
            cityName: locationName[0],
            countryName: locationName[1],
            weatherType: WeatherType.gps,
          );
        },
      ),
    );
  }

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    widget.getLocationData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: currentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              mainIcon,
              height: 125.0,
            ),
            SizedBox(height: 50.0),
            Text(
              waitString,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 50.0),
            Loading(
              indicator: BallPulseIndicator(),
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
