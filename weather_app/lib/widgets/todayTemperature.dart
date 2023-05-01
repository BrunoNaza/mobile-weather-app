import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class todayTemperature extends StatelessWidget {
  final String title = '23º';
  final String subtitle = 'Nublado';
  final String imagePath = 'assets/images/nuvem.png';


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
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}