import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

import '../../../colors.dart';
import '../../../strings.dart';
import '../../../services/weather.dart';
import '../weather_screen.dart';
import './city_textfield.dart';

enum Fetching {
  yes,
  no,
}

Fetching fetchingWeather = Fetching.no;

void chooseCity(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  void getWeather(chosenCity) async {
    print(chosenCity);

    fetchingWeather = Fetching.yes;

    var weatherData = await Weather().getCustomWeather(chosenCity);
    var locationName = await Weather().getCustomName(chosenCity);
    var timezoneData = await Weather().getCustomTimezone(chosenCity);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            locationWeather: weatherData,
            timezoneData: timezoneData,
            cityName: locationName[0],
            countryName: locationName[1],
          );
        },
      ),
    );
    fetchingWeather = Fetching.no;
  }

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          height: size.height * 0.28,
          padding: EdgeInsets.only(top: 36.0, bottom: 24.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                fetchingWeather == Fetching.yes
                    ? Loading(
                        indicator: BallPulseIndicator(),
                        color: textColor,
                      )
                    : Text(
                        searchString,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                SizedBox(height: 16.0),
                CityTextField(
                  hintText: searchTextFieldString,
                  onFieldSubmitted: getWeather,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
