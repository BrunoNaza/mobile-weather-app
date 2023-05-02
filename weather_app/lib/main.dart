import 'package:flutter/material.dart';
import 'package:weather_app/screens/CityScreen.dart';
import 'package:weather_app/screens/InitialScreen.dart';

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
        fontFamily: 'SF Pro Display', // nome da fonte que deseja utilizar
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        scaffoldBackgroundColor:  Colors.transparent,
      ),
      home: CityScreen(),

    );

  }
}
