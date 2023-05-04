
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/functions.dart';
import 'package:weather_app/themes/app_colors.dart';
import 'package:weather_app/themes/app_styles.dart';

class BoxForecastWeek extends StatelessWidget {

  late List<int> previsaoTempMaxSemana = List.filled(5, 0);
  late List<int> previsaoTempMinSemana = List.filled(5, 0);
  final List<String> imagePath;
  final List<String> nextFiveDays = getNextFiveDays();
  final String imagePathCalendar = 'assets/icons/calendar.png';

  BoxForecastWeek({
    required this.previsaoTempMaxSemana,
    required this.previsaoTempMinSemana,
    required this.imagePath,
  });


  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25.0,0,25.0,0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.decorationWidgets,
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Previsão do tempo',
                    style: AppStyles.boldSF20TextStyle,
                  ),
                  Image.asset(
                    imagePathCalendar,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              SizedBox(height: 8,),
              SizedBox(
            height: 280,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Text(
                          nextFiveDays[index+1],
                          style: AppStyles.boldAlegreya18TextStyle,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          imagePath[index+1],
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${previsaoTempMaxSemana[index+1]}ºC ',
                            style: AppStyles.alegreya18TextStyle,
                          ),
                          Text(
                            ' ${previsaoTempMinSemana[index+1]}ºC',
                            style: AppStyles.greyAlegreya18TextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
