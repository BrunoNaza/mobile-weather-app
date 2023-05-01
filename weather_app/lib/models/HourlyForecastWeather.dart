import 'dart:convert';
import 'package:http/http.dart' as http;

class HourlyForecastWeather {
  late String local;
  late List<int> previsaoTempPorHora = List.filled(12, 0);
  late List<String> previsaoCondPorHora = [];

  HourlyForecastWeather(String local) {
    this.local = local;
  }

  Future<void> preencherDados() async {
    final apiKey = 'eeaf4a6322df4a1aeaf8840d29ef32a0';
    final cidade = Uri.encodeComponent(this.local);
    final hourlyDataResponse = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cidade&appid=$apiKey&lang=pt_br&units=metric'));

    if (hourlyDataResponse.statusCode == 200) {
      final hourlyDataJson = jsonDecode(hourlyDataResponse.body);
      for (var i = 0; i < 12; i++) {
        previsaoTempPorHora[i] = hourlyDataJson['list'][i]['main']['temp'].toInt();
        previsaoCondPorHora.add(hourlyDataJson['list'][i]['weather'][0]['description']);
      }

      // Obter a lista de previsão de temperaturas horárias


    } else {
      throw Exception('Erro na requisição: ${hourlyDataResponse.statusCode}');
    }
  }

  //@override
  // String toString() {
  //   final mostraPrevisaoHoraria = StringBuffer('Previsão horária de temperatura:\n');
  //   for (var i = 0; i < 12; i++) {
  //     final hora = DateTime.now().add(Duration(hours: i)).hour;
  //     mostraPrevisaoHoraria.write('\t\t$hora:00 - ${this.previsaoTempPorHora[i]}°C - ${this.previsaoCondPorHora[i]}\n');
  //   }
  //   return '''
  //     Local: $local
  //     $mostraPrevisaoHoraria
  //   ''';
  // }
}