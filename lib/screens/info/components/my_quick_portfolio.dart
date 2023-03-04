import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../colors.dart';
import '../../../strings.dart';
import '../../../components/general_button.dart';

final AudioPlayer boomBabyPlayer = AudioPlayer()
  ..setAsset(
    'assets/boom.wav',
    preload: false,
  );

class MyQuickPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onLongPress: () => boomBabyPlayer
                ..load()
                ..play(),
              child: CircleAvatar(
                backgroundColor: textColor,
                radius: 85.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(josipImage),
                  radius: 82.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GeneralButton(
              text: aboutMeWebsiteString.toUpperCase(),
              horizontalPadding: 16.0,
              onPressed: () => launchUrl(Uri.parse(josipKilicWebsite)),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GeneralButton(
                  text: aboutMeGitHubString.toUpperCase(),
                  horizontalPadding: 16.0,
                  onPressed: () => launchUrl(Uri.parse(josipGithubWebsite)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GeneralButton(
                  text: aboutMeEmailString.toUpperCase(),
                  horizontalPadding: 16.0,
                  onPressed: () => launchUrl(Uri.parse(josipKilicEmail)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
