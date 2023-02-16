import 'package:flutter/material.dart';

import '../colors.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final Function onPressed;

  GeneralButton({
    this.text,
    this.horizontalPadding = 50.0,
    this.verticalPadding = 20.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(
            color: textColor,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
