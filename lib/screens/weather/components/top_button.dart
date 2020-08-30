import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunny/colors.dart';

class TopButton extends StatelessWidget {
  final Function onTap;
  final String icon;

  TopButton({
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.06,
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          color: textColor,
        ),
      ),
    );
  }
}
