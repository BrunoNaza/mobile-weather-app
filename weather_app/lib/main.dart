import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/themes/app_colors.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key : key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        iconTheme: const IconThemeData(
          color: AppColors.iconThemeMainColor,
        ),
        scaffoldBackgroundColor:  AppColors.transparentColor,
      ),
      home: HomeScreen(cidadeSelecionada: 'São Paulo'),

    );

  }
}
