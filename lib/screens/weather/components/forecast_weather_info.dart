import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../strings.dart';

class ForecastWeatherInfo extends StatelessWidget {
  final int index;
  final List<int> forecastHours;
  final List<String> forecastConditionIcons;
  final List<int> forecastTemperatures;

  ForecastWeatherInfo({
    this.index,
    this.forecastHours,
    this.forecastConditionIcons,
    this.forecastTemperatures,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          Text(
            '${forecastHours[index].toString()}:00' ?? noForecastHour,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.0),
          SvgPicture.asset(
            forecastConditionIcons[index] ?? noConditionIcon,
            height: 50.0,
          ),
          SizedBox(height: 8.0),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  forecastTemperatures[index].toString() ?? noTemperature,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '°',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
