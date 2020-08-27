import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../colors.dart';
import '../../strings.dart';
import '../../models/hourly_forecast.dart';
import '../../models/current_forecast.dart';
import '../../components/background_image.dart';
import './components/city_button.dart';
import './components/location_info.dart';
import './components/weather_info.dart';
import './components/conditions.dart';
import './components/hourly_forecast_widget.dart';
import './components/choose_city.dart';
import './components/categories.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weather-screen';

  final locationWeather;
  final timezoneData;
  final String cityName;
  final String countryName;

  WeatherScreen({
    this.locationWeather,
    this.timezoneData,
    this.cityName,
    this.countryName,
  });

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  DateTime currentTimeDirty = DateTime.now();
  int numberOfForecasts = 12;
  CurrentForecast currentForecast = CurrentForecast();
  List<HourlyForecast> hourlyForecastList = [];

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

  int getCurrentHour(dynamic timezoneData) {
    String hour = timezoneData['formatted'];
    hour = hour.substring(11, 13);

    return int.parse(hour);
  }

  void updateCurrentUI(dynamic weatherData) {
    currentForecast.condition = getWeatherCondition(weatherData, 0);

    currentForecast = CurrentForecast(
      time: DateFormat('E, dd MMM, H:mm').format(currentTimeDirty),
      temperature: getTemperature(weatherData, 0).toInt(),
      conditionIcon:
          '$conditionIconRootAddress${getWeatherCondition(weatherData, 0)}.svg',
      condition: getCondition(currentForecast.condition),
    );
  }

  void updateHourlyForecastUI(dynamic weatherData) {
    int currentHour = getCurrentHour(widget.timezoneData);

    for (int i = 0; i < numberOfForecasts; i++) {
      if (currentHour == 24) currentHour = 0;

      hourlyForecastList.add(
        HourlyForecast(
          condition: getWeatherCondition(weatherData, i),
          conditionIcon:
              '$conditionIconRootAddress${getWeatherCondition(weatherData, i)}.svg',
          hour: currentHour,
          temperature: getTemperature(weatherData, i).toInt(),
        ),
      );
      currentHour++;
    }
  }

  void updateUI(dynamic weatherData) {
    getCurrentHour(widget.timezoneData);
    updateCurrentUI(weatherData);
    updateHourlyForecastUI(weatherData);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: currentColor,
      body: BackgroundImage(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CityButton(
                  () => chooseCity(context),
                ),
                Column(
                  children: <Widget>[
                    LocationInfo(
                      cityName: widget.cityName,
                      countryName: widget.countryName,
                      currentTime: currentForecast.time,
                    ),
                    SvgPicture.asset(
                      currentForecast.conditionIcon ?? noConditionIcon,
                      height: size.height * 0.3,
                    ),
                    WeatherInfo(
                      temperature: currentForecast.temperature,
                      condition: currentForecast.condition,
                    ),
                    SizedBox(height: size.height * 0.08),
                    Categories(),
                    SizedBox(
                      height: size.height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: numberOfForecasts,
                        itemBuilder: (context, index) => HourlyForecastWidget(
                          hourlyForecastHour: hourlyForecastList[index].hour,
                          hourlyForecastConditionIcon:
                              hourlyForecastList[index].conditionIcon,
                          hourlyForecastTemperature:
                              hourlyForecastList[index].temperature,
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
