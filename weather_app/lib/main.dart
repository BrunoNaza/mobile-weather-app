import 'package:flutter/material.dart';
import 'package:weather_app/screens/error_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/themes/app_colors.dart';

import 'models/user_location.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key : key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  UserLocation _userLocation = UserLocation('', '');

  @override
  Widget build(BuildContext context) {
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
      home: FutureBuilder<void>(
        future: _userLocation.preencherDados(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen(
              cidadeSelecionada: _userLocation.city,
              userCity: _userLocation.city,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
