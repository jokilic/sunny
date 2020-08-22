import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors.dart';
import '../../../strings.dart';

class LocationInfo extends StatelessWidget {
  final String cityName;
  final String countryName;
  final String currentTime;

  LocationInfo({
    this.cityName,
    this.countryName,
    this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.75,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            gpsIcon,
            color: whiteColor,
            height: 26.0,
          ),
          SizedBox(height: 8.0),
          Container(
            child: Text(
              '$cityName, $countryName' ?? noCity,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: whiteColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            currentTime ?? noTime,
            style: TextStyle(
              color: whiteColor.withOpacity(0.6),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
