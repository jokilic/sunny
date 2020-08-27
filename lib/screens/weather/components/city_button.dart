import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CityButton extends StatelessWidget {
  final Function onTap;

  CityButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.06,
      margin: EdgeInsets.only(right: 24.0),
      alignment: Alignment.bottomRight,
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
