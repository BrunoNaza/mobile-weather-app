import 'package:flutter/material.dart';
import 'package:weather_app/screens/InitialScreen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cidadeSelecionada = 'Sao Paulo';
  String _selectedCity = 'São Paulo';
  List<String> _cities = ['São Paulo', 'Rio de Janeiro', 'Curitiba', 'Washington'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Cidade'),
      ),
      body:  Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selecione uma cidade:',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              DropdownButton(
                value: _selectedCity,
                items: _cities.map((String city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCity = value!;
                    if (_selectedCity == 'Sao Paulo') {
                      cidadeSelecionada = 'Sao Paulo';
                    } else if (_selectedCity == 'Rio de Janeiro') {
                      cidadeSelecionada = 'Rio de Janeiro';
                    } else if (_selectedCity == 'Curitiba') {
                      cidadeSelecionada = 'Curitiba';
                    } else if (_selectedCity == 'Washington') {
                      cidadeSelecionada = 'Washington';
                    }
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  InitialScreen(cidadeSelecionada: cidadeSelecionada)),
                  );
                },
                child: Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}