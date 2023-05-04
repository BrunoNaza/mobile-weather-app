import 'dart:convert';
import 'package:http/http.dart' as http;

class ForecastWeather {
  late String local;
  late List<int> previsaoTempPorHora = List.filled(8, 0);
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
      print(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cidade&appid=$apiKey&lang=pt_br&units=metric');
      probabilidadeDeChuva = (jsonResponse['list'][0]['pop']).toDouble() * 100;
      for (var i = 0; i < 8; i++) {
        previsaoTempPorHora[i] =
            jsonResponse['list'][i]['main']['temp'].toInt();
        iconPathPorHora.add(
            'assets/images/${jsonResponse['list'][i]['weather'][0]['icon']}.png');
      }

      for (int i = 0; i < 5; i++) {
        final dailyData = jsonResponse['list'][i * 8];
        iconPathPorSemana.add(
            'assets/images/${(dailyData['weather'][0]['icon']).replaceRange(2, 3, 'd')}.png');//Sempre mostra o icone de dia
      }

      // Dicionários para armazenar as temperaturas maxima e minima para cada dia.
      Map<String, List<int>> temperaturasMaxPorDia = {};
      Map<String, List<int>> temperaturasMinPorDia = {};

      for (int i = 0; i < jsonResponse['list'].length; i++) {

        final data = jsonResponse['list'][i];
        final date = DateTime.parse(data['dt_txt']);

        // Agrupa as temperaturas pela data.
        final dateString = '${date.year}-${date.month}-${date.day}';
        final temperaturesMax = temperaturasMaxPorDia.putIfAbsent(dateString, () => []);
        final temperaturesMin = temperaturasMinPorDia.putIfAbsent(dateString, () => []);

        // Adiciona as temperaturas máxima e mínima para o dia atual.
        temperaturesMax.add(data['main']['temp_max'].toInt());
        temperaturesMin.add(data['main']['temp_min'].toInt());
      }

      // Obtém a menor temperatura mínima e maior tempera maxima de cada dia e armazena em uma lista.
      int index = 0;
      for (final dayTemperatures in temperaturasMinPorDia.values) {
        if (index >= 5) {
          break;
        }
        final minTemp = dayTemperatures.reduce((a, b) => a < b ? a : b).toInt();
        previsaoTempPorSemanaMin[index] = minTemp;
        final maxTemp = dayTemperatures.reduce((a, b) => a > b ? a : b).toInt();
        previsaoTempPorSemanaMax[index] = maxTemp;
        index++;
      }


    } else {
      throw Exception('Erro na requisição: ${dataResponse.statusCode}');
    }
  }

}