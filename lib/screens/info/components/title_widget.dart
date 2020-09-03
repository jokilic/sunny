import 'package:flutter/material.dart';

import '../../../colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  TitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.0,
        left: 36.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
