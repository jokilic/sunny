import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../colors.dart';
import '../../strings.dart';
import '../info/info_screen.dart';
import '../../models/current_forecast.dart';
import '../../models/hourly_forecast.dart';
import '../../models/daily_forecast.dart';
import '../../components/gradient_background.dart';
import './components/top_button.dart';
import './components/location_info.dart';
import './components/weather_info.dart';
import '../../models/conditions.dart';
import './components/hourly_forecast_widget.dart';
import './components/daily_forecast_widget.dart';
import './components/choose_city.dart';
import '../loading/loading_screen.dart';

enum WeatherType {
  gps,
  custom,
}

enum Fetching {
  yes,
  no,
}

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weather-screen';

  final locationWeather;
  final timezoneData;
  final String cityName;
  final String countryName;
  final WeatherType weatherType;

  WeatherScreen({
    this.locationWeather,
    this.timezoneData,
    this.cityName,
    this.countryName,
    this.weatherType,
  });

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  DateTime currentTimeDirty = DateTime.now();
  int numberOfForecasts = 12;
  List<String> categories = ['Today', 'Week'];
  int selectedIndex = 0;
  Fetching fetching = Fetching.no;

  CurrentForecast currentForecast = CurrentForecast();
  List<HourlyForecast> hourlyForecastList = [];
  List<DailyForecast> dailyForecastList = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  double getTemperature(dynamic weatherData, int index) => weatherData['properties']['timeseries'][index]['data']['instant']['details']['air_temperature'];

  String getWeatherCondition(dynamic weatherData, int index) => weatherData['properties']['timeseries'][index]['data']['next_1_hours']['summary']['symbol_code'];

  String getDailyWeatherCondition(dynamic weatherData, int index) => weatherData['properties']['timeseries'][index]['data']['next_12_hours']['summary']['symbol_code'];

  int getCurrentHour(dynamic timezoneData) {
    String hour = timezoneData['formatted'];
    hour = hour.substring(11, 13);

    return int.parse(hour);
  }

  int getCurrentDate(dynamic timezoneData) {
    String date = timezoneData['formatted'];
    date = date.substring(8, 10);

    return int.parse(date);
  }

  void updateCurrentUI(dynamic weatherData) {
    currentForecast.condition = getWeatherCondition(weatherData, 0);
    currentColors = getColors(currentForecast.condition);

    currentForecast = CurrentForecast(
      time: DateFormat('E, dd MMM, H:mm').format(currentTimeDirty),
      temperature: getTemperature(weatherData, 0).toInt(),
      conditionIcon: '$conditionIconRootAddress${getWeatherCondition(weatherData, 0)}.svg',
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
          conditionIcon: '$conditionIconRootAddress${getWeatherCondition(weatherData, i)}.svg',
          hour: currentHour,
          temperature: getTemperature(weatherData, i).toInt(),
        ),
      );
      currentHour++;
    }
  }

  void updateDailyForecastUI(dynamic weatherData, dynamic timezoneData) {
    int hour;
    int day;
    int month;
    String date;
    String condition;
    String conditionIcon;
    String fullTime;

    for (int i = 0; i < 80; i++) {
      fullTime = weatherData['properties']['timeseries'][i]['time'];

      hour = int.parse(fullTime.substring(11, 13));
      day = int.parse(fullTime.substring(8, 10));
      month = int.parse(fullTime.substring(5, 7));

      if (hour == 0 || hour == 12) {
        date = '$day.$month.';
        condition = getDailyWeatherCondition(weatherData, i);
        conditionIcon = condition;
        condition = getCondition(condition);

        dailyForecastList.add(
          DailyForecast(date: date, condition: condition, conditionIcon: '$conditionIconRootAddress$conditionIcon.svg') ?? noConditionIcon,
        );
      }
    }
  }

  void updateUI(dynamic weatherData) {
    getCurrentHour(widget.timezoneData);
    updateCurrentUI(weatherData);
    updateHourlyForecastUI(weatherData);
    updateDailyForecastUI(weatherData, widget.timezoneData);

    setState(() {});
  }

  void fetchLocationWeather() {
    setState(() {
      fetching = Fetching.yes;
      LoadingScreen().getLocationData(context);
      currentColors = primaryColors;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GradientBackground(
      colors: currentColors,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: fetching == Fetching.no
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.weatherType == WeatherType.custom
                              ? SizedBox(
                                  width: 45.0,
                                  child: TopButton(onTap: () => fetchLocationWeather(), icon: gpsIcon, margin: EdgeInsets.only(left: 20.0)),
                                )
                              : SizedBox(width: 45.0),
                          Row(
                            children: [
                              SizedBox(
                                width: 42.0,
                                child: TopButton(
                                  onTap: () => chooseCity(context),
                                  icon: searchIcon,
                                  margin: EdgeInsets.only(right: 20.0),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              SizedBox(
                                width: 42.0,
                                child: TopButton(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    InfoScreen.routeName,
                                  ),
                                  icon: menuIcon,
                                  margin: EdgeInsets.only(right: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          LocationInfo(
                            cityName: widget.cityName,
                            countryName: widget.countryName,
                            currentTime: currentForecast.time,
                            weatherType: widget.weatherType,
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
                          SizedBox(
                            width: 150.0,
                            height: 60.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: categories.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        categories[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5.0),
                                        decoration: BoxDecoration(
                                          color: selectedIndex == index ? textColor : Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        width: 8.0,
                                        height: 8.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (selectedIndex == 0)
                            SizedBox(
                              height: size.height * 0.3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: numberOfForecasts,
                                itemBuilder: (context, index) => HourlyForecastWidget(
                                  hourlyForecastHour: hourlyForecastList[index].hour,
                                  hourlyForecastConditionIcon: hourlyForecastList[index].conditionIcon,
                                  hourlyForecastTemperature: hourlyForecastList[index].temperature,
                                ),
                              ),
                            ),
                          if (selectedIndex == 1)
                            SizedBox(
                              height: size.height * 0.3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: numberOfForecasts,
                                itemBuilder: (context, index) => DailyForecastWidget(
                                  dailyForecastDate: dailyForecastList[index].date,
                                  dailyForecastConditionIcon: dailyForecastList[index].conditionIcon,
                                  dailyForecastCondition: dailyForecastList[index].condition,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                )
              : LoadingScreen().buildLoadingScreen(),
        ),
      ),
    );
  }
}
