import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/themes/app_colors.dart';

import '../models/user_location.dart';
import '../themes/app_styles.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  UserLocation _userLocation = UserLocation('', '');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body:  Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(70.0,0,70.0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(
                  Icons.error,

                  size: 100.0,
                ),
                SizedBox(height: 20,),

                Text(
                  'Sentimos muito, ocorreu um erro ao carregar a página',
                  style: AppStyles.alegreya18TextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),

                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      await _userLocation.preencherDados();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            cidadeSelecionada: _userLocation.city,
                            userCity: _userLocation.city,
                          ),
                        ),
                      );
                    } catch (e) {
                      print('Error: $e');
                      setState(() {}); // Force rebuild to show error message
                    }
                  },
                  icon: Icon(Icons.refresh),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Tentar novamente', style: AppStyles.SF18TextStyle,),
                      SizedBox(width: 8.0),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.decorationWidgets,
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.white.withOpacity(0.5), width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}