import 'dart:convert';
import 'package:http/http.dart' as http;

class UserLocation {
  late String ip;
  late String city;

UserLocation(this.ip, this.city);

  Future<void> preencherDados() async {
      ip = await getIpAddress();
      city = await getCityFromIp(ip);
  }

  Future<String> getIpAddress() async {
    var response = await http.get(Uri.parse('https://api.ipify.org'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Erro ao obter endereço IP');
    }
  }

  Future<String> getCityFromIp(String ip) async {
    var response = await http.get(Uri.parse('https://get.geojs.io/v1/ip/geo/$ip.json'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['city'];
    } else {
      throw Exception('Erro ao obter cidade a partir do endereço de IP');
    }
  }

}

