import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/functions.dart';

enum DiaDaSemana {
  seg,
  ter,
  qua,
  qui,
  sex,
  sab,
  dom
}

class WeatherNow {
  late String local;
  late DiaDaSemana nome;
  late var data;
  late int tempMax;
  late int tempMin;
  late int temperatura;
  late double cloudiness;
  //late double chuva;
  late double velocidadeDoVento;
  late String descricao;
  late String iconPath;
  late int umidade;


  Future<void> preencherDados(String local, var data) async {
    this.local = local;
    this.data = data;
    final apiKey = 'eeaf4a6322df4a1aeaf8840d29ef32a0';
    final cidade = Uri.encodeComponent(this.local);
    final dataFormatada = this.data.toString().substring(0, 10);
    final response = await http.get(Uri.parse( 'https://api.openweathermap.org/data/2.5/weather?q=$cidade&dt=$dataFormatada&appid=$apiKey&lang=pt_br&units=metric'));
    print('https://api.openweathermap.org/data/2.5/weather?q=$cidade&dt=$dataFormatada&appid=$apiKey&lang=pt_br&units=metric');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      this.nome = DiaDaSemana.values[this.data.weekday - 1];
      this.tempMax = data['main']['temp_max'].toInt();
      this.tempMin = data['main']['temp_min'].toInt();
      this.temperatura = data['main']['temp'].toInt();
      this.cloudiness = data['clouds']['all'].toDouble();
     // this.chuva = data.containsKey('rain') ? data['rain']['1h'].toDouble() : 0;
      this.umidade = data['main']['humidity'];
      this.velocidadeDoVento =(data['wind']['speed'].toDouble())*3.6;
      this.descricao = capitalize(data['weather'][0]['description']);
      this.iconPath = 'assets/images/${data['weather'][0]['icon']}.png';


    } else {
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
  }

  // @override
  // String toString() {
  //   return '''
  //     Local: $local
  //     Dia da semana: ${nome.toString().split('.').last}
  //     Data: $data
  //     Temperatura máxima: $tempMax °C
  //     Temperatura mínima: $tempMin °C
  //     Temperatura média: $temperatura °C
  //     Nível de nuvens: $cloudiness %
  //     Chuva: $chuva mm
  //     Probabilidade de chuva: $probabilidadeDeChuva %
  //     Velocidade do vento: $velocidadeDoVento km/h
  //     Descrição: $descricao
  //     Condição: $condicao
  //   ''';
  // }

}

