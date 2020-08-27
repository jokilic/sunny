import 'package:flutter/material.dart';
import 'package:sunny/colors.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = '/info-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(
          'Hej bejbe',
          style: TextStyle(
            color: textColor,
            fontSize: 56.0,
          ),
        ),
      ),
    );
  }
}
