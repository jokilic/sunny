import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../colors.dart';
import '../../strings.dart';
import './components/city_button.dart';
import './components/location_info.dart';
import './components/weather_info.dart';
import './components/conditions.dart';
import './components/forecast_weather_info.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weather-screen';

  final locationWeather;
  final String cityName;
  final String countryName;

  WeatherScreen({
    this.locationWeather,
    this.cityName,
    this.countryName,
  });

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int numberOfForecasts = 10;
  String currentTime;
  String currentWeatherCondition;
  String currentConditionIcon;
  int currentTemperature;
  DateTime currentTimeDirty = DateTime.now();
  List<int> forecastHours = [];
  List<String> forecastConditions = [];
  List<String> forecastConditionIcons = [];
  List<int> forecastTemperatures = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  double getTemperature(dynamic weatherData, int index) =>
      weatherData['properties']['timeseries'][index]['data']['instant']
          ['details']['air_temperature'];

  String getWeatherCondition(dynamic weatherData, int index) =>
      weatherData['properties']['timeseries'][index]['data']['next_1_hours']
          ['summary']['symbol_code'];

  void updateCurrentUI(dynamic weatherData) {
    currentTime = DateFormat('E, dd MMM, H:mm').format(currentTimeDirty);
    currentTemperature = getTemperature(weatherData, 0).toInt();
    currentWeatherCondition = getWeatherCondition(weatherData, 0);
    currentConditionIcon =
        '$conditionIconRootAddress$currentWeatherCondition.svg';
    currentWeatherCondition = getCondition(currentWeatherCondition);
  }

  void updateForecastUI(dynamic weatherData) {
    int currentHour = int.parse(DateFormat('H').format(currentTimeDirty));

    for (int i = 0; i < numberOfForecasts; i++) {
      if (currentHour == 24) currentHour = 0;
      forecastHours.add(currentHour + 1);
      currentHour++;
      forecastConditions.add(getWeatherCondition(weatherData, i + 1));
      forecastConditionIcons
          .add('$conditionIconRootAddress${forecastConditions[i]}.svg');
      forecastTemperatures.add(getTemperature(weatherData, i + 1).toInt());
    }
  }

  void updateUI(dynamic weatherData) {
    updateCurrentUI(weatherData);
    updateForecastUI(weatherData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: currentColor,
          child: Column(
            children: <Widget>[
              CityButton(
                () => print('Stisnuo si Menu button'),
              ),
              Column(
                children: <Widget>[
                  LocationInfo(
                    cityName: widget.cityName,
                    countryName: widget.countryName,
                    currentTime: currentTime,
                  ),
                  SvgPicture.asset(
                    currentConditionIcon ?? noConditionIcon,
                    height: 250.0,
                  ),
                  WeatherInfo(
                    temperature: currentTemperature,
                    condition: currentWeatherCondition,
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: numberOfForecasts,
                      itemBuilder: (context, index) => ForecastWeatherInfo(
                        index: index,
                        forecastHours: forecastHours,
                        forecastConditionIcons: forecastConditionIcons,
                        forecastTemperatures: forecastTemperatures,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
