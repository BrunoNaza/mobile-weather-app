import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/BoxHour.dart';
import 'package:weather_app/widgets/BoxWeek.dart';
import '../models/WeatherNow.dart';
import '../models/ForecastWeather.dart';
import '../widgets/IconBar.dart';
import '../widgets/TodayTemperature.dart';
import 'CityScreen.dart';


class InitialScreen extends StatefulWidget {
  final String cidadeSelecionada;
  InitialScreen({required this.cidadeSelecionada});

  @override
  State<InitialScreen> createState() => _InitialScreenState(cidadeSelecionada);
}


class _InitialScreenState extends State<InitialScreen> {
  final String cidadeSelecionada;
  _InitialScreenState(this.cidadeSelecionada);
  WeatherNow  dia = WeatherNow();
  ForecastWeather forecast = ForecastWeather();

  @override
  void initState() {
    super.initState();
    forecast.preencherDados(cidadeSelecionada); // preenche os dados assim que o estado é criado
    dia.preencherDados(cidadeSelecionada,  DateTime.now());
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF08244F),
              Color(0xFF134CB5),
              Color(0xFF0B42AB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: Future.wait([
            dia.preencherDados(cidadeSelecionada,  DateTime.now()),
            forecast.preencherDados(cidadeSelecionada),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar dados');
            } else {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child:
                  Column(
                    children: [
                      ElevatedButton(

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0x4D001026)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CityScreen()),
                          );

                        },

                        child: Text('${cidadeSelecionada} - Selecionar outra cidade'),
                      ),
                      TodayTemperature(
                        title: '${dia.temperatura}°' ,
                        subtitle: '${dia.descricao}\n Max.: ${dia.tempMax}º Min.: ${dia.tempMin}º',
                        imagePath: dia.iconPath,
                      ),
                      IconBar(
                        textLeft: '${dia.umidade.toString()}%',
                        textMiddle: '${forecast.probabilidadeDeChuva.toStringAsFixed(1)}%',
                        textRight: '${dia.velocidadeDoVento.toStringAsFixed(1)} Km/h',
                      ),
                      SizedBox(height: 20,),
                      BoxHour(
                                previsaoTempPorHora: forecast.previsaoTempPorHora,
                                imagePath: forecast.iconPathPorHora,
                            ),
                      SizedBox(height: 20,),
                      BoxWeek(
                                previsaoTempMaxSemana: forecast.previsaoTempPorSemanaMax,
                                previsaoTempMinSemana: forecast.previsaoTempPorSemanaMin,
                                imagePath: forecast.iconPathPorSemana,
                            ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}