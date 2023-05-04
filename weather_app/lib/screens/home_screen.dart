import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/user_location.dart';
import 'package:weather_app/themes/app_colors.dart';
import 'package:weather_app/widgets/box_hour_forecast.dart';
import 'package:weather_app/widgets/box_forecast_week.dart';
import '../models/weather_now.dart';
import '../models/forecast_weather.dart';
import '../widgets/custom_dropdown_button.dart';
import '../widgets/icon_bar.dart';
import '../widgets/today_temperature.dart';
import 'error_screen.dart';


class HomeScreen extends StatefulWidget {
  String cidadeSelecionada;
  String userCity;
  HomeScreen({required this.cidadeSelecionada, required this.userCity});

  @override
  State<HomeScreen> createState() => _HomeScreenState(cidadeSelecionada, userCity);
}


class _HomeScreenState extends State<HomeScreen> {
  late final String cidadeSelecionada;
  late final String userCity;
  _HomeScreenState(this.cidadeSelecionada, this.userCity);
  WeatherNow  dia = WeatherNow();
  ForecastWeather forecast = ForecastWeather();
  final String imagePathBell = 'assets/icons/bell.png';

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
          gradient: AppColors.backgroundGradient,
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
              return ErrorScreen();
            } else {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child:
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
                        child: Row(
                            children: [
                              Expanded(
                                child: CustomDropdownButton(
                                  items: ['São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Florianopolis', userCity],
                                  hintText: cidadeSelecionada,
                                  onChanged: (String? newValue) {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  HomeScreen(cidadeSelecionada: newValue!, userCity: userCity,)),
                                    );
                                  },
                                ),
                              ),
                              Image.asset(
                                  imagePathBell,
                                width: 29,
                                height: 27,
                              ),
                            ],
                        ),
                      ),
                      TodayTemperature(
                        title: '${dia.temperatura}°' ,
                        subtitle: '${dia.descricao}\n Max.: ${dia.tempMax}º Min.: ${dia.tempMin}º',
                        imagePath: dia.iconPath,
                      ),
                      IconBar(
                        textLeft: '${forecast.probabilidadeDeChuva.toStringAsFixed(1)}%',
                        textMiddle: '${dia.umidade.toString()}%',
                        textRight: '${dia.velocidadeDoVento.toStringAsFixed(1)} Km/h',
                      ),
                      SizedBox(height: 20,),
                      BoxHourForecast(
                        previsaoTempPorHora: forecast.previsaoTempPorHora,
                        imagePath: forecast.iconPathPorHora,
                      ),
                      SizedBox(height: 20,),
                      BoxForecastWeek(
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