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
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.lightBlueAccent,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: CityScreen(),
    );
  }
}
