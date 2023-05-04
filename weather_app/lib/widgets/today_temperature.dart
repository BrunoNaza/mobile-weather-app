import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/themes/app_styles.dart';


class TodayTemperature extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  TodayTemperature({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: AppStyles.boldSF64TextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          subtitle,
          style: AppStyles.SF18TextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 42),
      ],
    );
  }
}