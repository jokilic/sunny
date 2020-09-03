import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

import '../../colors.dart';
import '../../strings.dart';
import '../../components/gradient_background.dart';
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

  Widget buildLoadingScreen() {
    return GradientBackground(
      colors: primaryColors,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    appName.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 56.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: yrNoFirstString,
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: yrNoSecondString,
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.0),
              SvgPicture.asset(
                sunIcon,
                color: secondaryColor,
                height: 110.0,
              ),
            ],
          ),
          SizedBox(height: 50.0),
          Text(
            waitString,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.0),
          Loading(
            indicator: BallPulseIndicator(),
            color: secondaryColor,
          ),
        ],
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
      body: widget.buildLoadingScreen(),
    );
  }
}
