import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors.dart';
import '../../strings.dart';
import '../../components/gradient_background.dart';
import '../../components/hero_section.dart';
import './components/title_widget.dart';
import './components/standard_text.dart';
import './components/my_quick_portfolio.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = '/info-screen';

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      colors: currentColors,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.0),
              HeroSection(
                textColor: textColor,
              ),
              SizedBox(height: 36.0),
              TitleWidget(aboutSunnyTitleString),
              StandardText(
                RichText(
                  text: TextSpan(
                    text: appName,
                    style: TextStyle(
                      color: textColor,
                      height: 1.5,
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: aboutSunnyFirstString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: aboutSunnySecondString,
                      ),
                      TextSpan(
                        text: aboutSunnyThirdString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: aboutSunnyFourthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: aboutSunnyFifthString,
                      ),
                      TextSpan(
                        text: aboutSunnySixthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: aboutSunnySeventhString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: aboutSunnyFifthString,
                      ),
                      TextSpan(
                        text: aboutSunnyEighthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: aboutSunnyNinthString,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(flutterWebsite),
                      ),
                      TextSpan(
                        text: aboutSunnyTenthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TitleWidget(weatherProviderTitleString),
              StandardText(
                RichText(
                  text: TextSpan(
                    text: weatherProviderFirstString,
                    style: TextStyle(
                      color: textColor,
                      height: 1.5,
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: weatherProviderSecondString,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(yrNoWebsite),
                      ),
                      TextSpan(
                        text: weatherProviderThirdString,
                      ),
                      TextSpan(
                        text: weatherProviderFourthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: weatherProviderFifthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TitleWidget(whoTitleString),
              StandardText(
                RichText(
                  text: TextSpan(
                    text: whoFirstString,
                    style: TextStyle(
                      color: textColor,
                      height: 1.5,
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: whoSecondString,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: whoThirdString,
                      ),
                      TextSpan(
                        text: whoFourthString,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: whoFifthString,
                      ),
                      TextSpan(
                        text: whoSixthString,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              MyQuickPortfolio(),
              StandardText(
                Text(
                  whoSeventhString,
                  style: TextStyle(
                    color: textColor,
                    height: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              StandardText(
                Text(
                  thanksString,
                  style: TextStyle(
                    color: textColor,
                    height: 1.5,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 36.0),
            ],
          ),
        ),
      ),
    );
  }
}
