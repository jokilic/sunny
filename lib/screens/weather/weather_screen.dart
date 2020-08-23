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
  int numberOfForecasts = 14;
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

  int getForecastTime(dynamic weatherData, int index) {
    String forecastTimeString =
        weatherData['properties']['timeseries'][index]['time'];
    int forecastTime = int.parse(forecastTimeString.substring(
            forecastTimeString.indexOf('T') + 1, 13)) +
        2;
    if (forecastTime == 24) forecastTime = 0;
    if (forecastTime == 25) forecastTime = 1;
    return forecastTime;
  }

  void updateCurrentUI(dynamic weatherData) {
    currentTime = DateFormat('E, dd MMM, H:mm').format(currentTimeDirty);
    currentTemperature = getTemperature(weatherData, 0).toInt();
    currentWeatherCondition = getWeatherCondition(weatherData, 0);
    currentConditionIcon =
        '$conditionIconRootAddress$currentWeatherCondition.svg';
    currentWeatherCondition = getCondition(currentWeatherCondition);
  }

  void updateForecastUI(dynamic weatherData) {
    for (int i = 0; i < numberOfForecasts; i++) {
      forecastHours.add(getForecastTime(weatherData, i));
      forecastConditions.add(getWeatherCondition(weatherData, i));
      forecastConditionIcons
          .add('$conditionIconRootAddress${forecastConditions[i]}.svg');
      forecastTemperatures.add(getTemperature(weatherData, i).toInt());
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
      backgroundColor: currentColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: currentColor,
          child: SingleChildScrollView(
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
      ),
    );
  }
}
