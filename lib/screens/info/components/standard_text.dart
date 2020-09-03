import 'package:flutter/material.dart';

class StandardText extends StatelessWidget {
  final Widget textChild;

  StandardText(this.textChild);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: textChild,
    );
  }
}
