import 'dart:convert';
import 'package:http/http.dart' as http;

class ForecastWeather {
  late String local;
  late List<int> previsaoTempPorHora = List.filled(12, 0);
  late List<int> previsaoTempPorSemanaMax = List.filled(5, 0);
  late List<int> previsaoTempPorSemanaMin = List.filled(5, 0);
  late List<String> iconPathPorHora = [];
  late List<String> iconPathPorSemana = [];
  late double probabilidadeDeChuva = 0.0;


  Future<void> preencherDados(String local) async {
    this.local = local;
    final apiKey = 'eeaf4a6322df4a1aeaf8840d29ef32a0';
    final cidade = Uri.encodeComponent(this.local);
    final dataResponse = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cidade&appid=$apiKey&lang=pt_br&units=metric'));


    if (dataResponse.statusCode == 200) {
      final jsonResponse = jsonDecode(dataResponse.body);
      print('https://api.openweathermap.org/data/2.5/forecast?q=$cidade&appid=$apiKey&lang=pt_br&units=metric');
      probabilidadeDeChuva = (jsonResponse['list'][0]['pop']).toDouble() * 100;
      for (var i = 0; i < 12; i++) {
        previsaoTempPorHora[i] = jsonResponse['list'][i]['main']['temp'].toInt();
        iconPathPorHora.add('assets/images/${jsonResponse['list'][i]['weather'][0]['icon']}.png');
      }
      
      for (int i = 0; i < 5; i++) {
        final dailyData = jsonResponse['list'][i * 8];

        // Obtemos as temperaturas máxima e mínima para o dia atual.
        previsaoTempPorSemanaMax[i] = dailyData['main']['temp_max'].toInt();
        previsaoTempPorSemanaMin[i] = dailyData['main']['temp_min'].toInt();
        iconPathPorSemana.add('assets/images/${dailyData['weather'][0]['icon']}.png');
      }

    } else {
      throw Exception('Erro na requisição: ${dataResponse.statusCode}');
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