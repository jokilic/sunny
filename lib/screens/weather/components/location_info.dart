import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../strings.dart';
import '../weather_screen.dart';

class LocationInfo extends StatelessWidget {
  final String cityName;
  final String countryName;
  final String currentTime;
  final WeatherType weatherType;

  LocationInfo({
    this.cityName,
    this.countryName,
    this.currentTime,
    this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.75,
      child: Column(
        children: <Widget>[
          if (weatherType == WeatherType.gps)
            SvgPicture.asset(
              gpsIcon,
              color: textColor,
              height: 26.0,
            ),
          SizedBox(height: 8.0),
          Container(
            child: Text(
              '$cityName, $countryName' ?? noCity,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            currentTime ?? noTime,
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
