import 'package:flutter/material.dart';
import 'package:sunny/screens/weather/components/search_button.dart';

import '../../../colors.dart';
import '../../../strings.dart';
import './city_textfield.dart';

void chooseCity(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height * 0.4,
          padding: EdgeInsets.only(top: 36.0, bottom: 24.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  searchString,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.0),
                CityTextField(
                  hintText: searchTextFieldString,
                  onFieldSubmitted: null,
                ),
                SizedBox(height: 30.0),
                SearchButton(
                  onPressed: null,
                  text: searchButtonString.toUpperCase(),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      );
    },
  );
}
