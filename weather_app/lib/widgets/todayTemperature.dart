import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontFamily: 'SF Pro Display', fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          subtitle,
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 42),
      ],
    );
  }
}