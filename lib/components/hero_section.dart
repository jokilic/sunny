import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../strings.dart';

class HeroSection extends StatelessWidget {
  final Color iconColor;
  final Color textColor;

  HeroSection({
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              appName.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 56.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            RichText(
              text: TextSpan(
                text: yrNoFirstString,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: yrNoSecondString,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 8.0),
        SvgPicture.asset(
          sunIcon,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
          height: 110.0,
        ),
      ],
    );
  }
}
