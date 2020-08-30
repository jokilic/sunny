import 'package:flutter/material.dart';

import '../../../colors.dart';

class CityTextField extends StatelessWidget {
  final String hintText;
  final Function onFieldSubmitted;

  CityTextField({
    this.hintText,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 12.0),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        style: TextStyle(
          color: textColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: buildInputBorder(),
          enabledBorder: buildInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(
            color: textColor.withOpacity(0.6),
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        cursorColor: textColor,
        cursorRadius: Radius.circular(16.0),
        cursorWidth: 4.0,
      ),
    );
  }
}

// Make Input Border
UnderlineInputBorder buildInputBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: textColor,
      width: 2.0,
    ),
  );
}
