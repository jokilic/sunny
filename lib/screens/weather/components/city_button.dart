import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CityButton extends StatelessWidget {
  final Function onTap;

  CityButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 24.0,
        right: 24.0,
      ),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 22.0,
          width: 22.0,
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
          ),
        ),
      ),
    );
  }
}
