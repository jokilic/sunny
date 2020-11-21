import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../strings.dart';

class DailyForecastWidget extends StatelessWidget {
  final String? dailyForecastDate;
  final String? dailyForecastCondition;
  final String? dailyForecastConditionIcon;

  DailyForecastWidget({
    this.dailyForecastCondition,
    this.dailyForecastDate,
    this.dailyForecastConditionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Text(
            dailyForecastDate ?? noForecastHour,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.0),
          SvgPicture.asset(
            dailyForecastConditionIcon ?? noConditionIcon,
            height: 50.0,
          ),
          SizedBox(height: 8.0),
          Container(
            width: 100.0,
            child: Text(
              dailyForecastCondition ?? noTemperature,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
