import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../strings.dart';

class HourlyForecastWidget extends StatelessWidget {
  final int? hourlyForecastHour;
  final int? hourlyForecastTemperature;
  final String? hourlyForecastConditionIcon;

  HourlyForecastWidget({
    this.hourlyForecastHour,
    this.hourlyForecastTemperature,
    this.hourlyForecastConditionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          Text(
            '${hourlyForecastHour.toString()}:00',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.0),
          SvgPicture.asset(
            hourlyForecastConditionIcon ?? noConditionIcon,
            height: 50.0,
          ),
          SizedBox(height: 8.0),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  hourlyForecastTemperature.toString(),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '°',
                style: TextStyle(
                  color: textColor,
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
