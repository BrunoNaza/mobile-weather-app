import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/themes/app_colors.dart';
import 'package:weather_app/themes/app_styles.dart';

import '../helpers/functions.dart';
import 'hover_container.dart';

class BoxHourForecast extends StatelessWidget {

  late List<int> previsaoTempPorHora = List.filled(8, 0);
  final List<String> imagePath;

  BoxHourForecast({
    required this.previsaoTempPorHora,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25.0,0,25.0,0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.decorationWidgets,
        ),
        constraints: BoxConstraints(
          minHeight: 217,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hoje',
                    style: AppStyles.boldSF20TextStyle,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getCurrentDate(),
                          style: AppStyles.SF18TextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 155,
                  minWidth: 70,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 8; i++)
                        HoverContainer(
                          onTapDown: () {
                            // Do something when the container is touched
                          },
                          onTapUp: () {
                            // Do something when the touch is released
                          },
                          child:  Column(
                            children:  [
                              Text(
                                '${previsaoTempPorHora[i]}°C',
                                style: AppStyles.SF18TextStyle,
                              ),
                              SizedBox(height: 20,),
                              Image.asset(
                                imagePath[i],
                                width: 43,
                                height: 43,
                              ),
                              SizedBox(height: 20,),
                              Text(
                                '${DateTime.now().add(Duration(hours: (i+1)*3)).hour}:00',
                                style: AppStyles.SF18TextStyle,

                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
