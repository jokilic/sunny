import 'package:flutter/material.dart';

import '../../../colors.dart';

class SearchButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  SearchButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 36.0,
          vertical: 20.0,
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
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: BorderSide(
          color: textColor,
          width: 2.0,
        ),
      ),
    );
  }
}
