import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../strings.dart';

class WeatherInfo extends StatelessWidget {
  final int temperature;
  final String condition;

  WeatherInfo({
    this.temperature,
    this.condition,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  temperature.toString() ?? noTemperature,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 96.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '°',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: size.width * 0.75,
          child: Text(
            condition ?? noCondition,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: whiteColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
