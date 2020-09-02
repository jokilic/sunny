import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

import '../../../colors.dart';
import '../../../strings.dart';
import '../../../services/weather.dart';
import '../weather_screen.dart';
import './city_textfield.dart';

double modalHeightPercentage;

enum Fetching {
  yes,
  no,
}

enum LocationError {
  yes,
  no,
}

Fetching fetchingWeather = Fetching.no;
LocationError locationError = LocationError.no;

void chooseCity(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  modalHeightPercentage = 0.32;

  void getWeather(chosenCity) async {
    fetchingWeather = Fetching.yes;
    locationError = LocationError.no;

    var weatherData = await Weather().getCustomWeather(chosenCity);
    var locationName = await Weather().getCustomName(chosenCity);
    var timezoneData = await Weather().getCustomTimezone(chosenCity);

    if (locationError == LocationError.no)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WeatherScreen(
              locationWeather: weatherData,
              timezoneData: timezoneData,
              cityName: locationName[0],
              countryName: locationName[1],
              weatherType: WeatherType.custom,
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
          height: size.height * modalHeightPercentage,
          padding: EdgeInsets.only(top: 36.0, bottom: 24.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 1.0],
              colors: modalColors,
            ),
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
                SizedBox(height: 16.0),
                if (locationError == LocationError.yes)
                  Text(
                    searchCityError,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
