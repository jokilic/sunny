import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../strings.dart';
import '../../../services/weather.dart';
import '../weather_screen.dart';
import './city_textfield.dart';
import './search_button.dart';

void chooseCity(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  void getWeather(chosenCity) async {
    print(chosenCity);
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
          height: size.height * 0.4,
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
              children: [
                Text(
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
                SizedBox(height: 30.0),
                SearchButton(
                  onPressed: null,
                  text: searchButtonString.toUpperCase(),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      );
    },
  );
}
