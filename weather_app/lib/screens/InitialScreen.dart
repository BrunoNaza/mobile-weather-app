import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/BoxHour.dart';
import '../models/WeatherNow.dart';
import '../models/HourlyForecastWeather.dart';
import '../widgets/iconBar.dart';
import '../widgets/todayTemperature.dart';
import 'CityScreen.dart';


class InitialScreen extends StatefulWidget {
  final String cidadeSelecionada;

  InitialScreen({required this.cidadeSelecionada});

  @override
  State<InitialScreen> createState() => _InitialScreenState(cidadeSelecionada);
}


class _InitialScreenState extends State<InitialScreen> {
  final dia = WeatherNow('Amherst',  DateTime.now());
  final hora = HourlyForecastWeather('Sao paulo');
  bool opacidade = true;
  final String cidadeSelecionada;
  _InitialScreenState(this.cidadeSelecionada);


  Widget build(BuildContext context) {
    dia.preencherDados();
    hora.preencherDados();
    final horario = DateTime.now().add(Duration(hours: 2)).hour;
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CityScreen()),
                  );
                },
                child: Text('${cidadeSelecionada} - Selecionar outra cidade'),
              ),
              todayTemperature(),
              iconBar(),
              SizedBox(

                height: 500, // Defina uma altura específica para o ListView
                child: ListView(
                  shrinkWrap: false, // Ajuste o shrinkWrap para false
                  children: [
                    BoxHour(),
                    // Adicione mais elementos aqui
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}