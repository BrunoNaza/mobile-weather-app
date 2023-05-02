
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/functions.dart';

class BoxWeek extends StatelessWidget {

  late List<int> previsaoTempMaxSemana = List.filled(5, 0);
  late List<int> previsaoTempMinSemana = List.filled(5, 0);
  final List<String> imagePath;
  final List<String> nextFiveDays = getNextFiveDays();

  BoxWeek({
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
          color: const Color(0x4D001026),
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
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.calendar_month,
                  ),
                ],
              ),
              SizedBox(height: 8,),
              SizedBox(
            height: 280,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Text(
                          nextFiveDays[index],
                          style: const TextStyle(
                            fontFamily: 'Alegreya Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          imagePath[index],
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${previsaoTempMaxSemana[index]}ºC ',
                            style: const TextStyle(
                              fontFamily: 'Alegreya Sans',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ' ${previsaoTempMinSemana[index]}ºC',
                            style: const TextStyle(
                              fontFamily: 'Alegreya Sans',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
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
