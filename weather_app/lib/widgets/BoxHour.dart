import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/functions.dart';

class BoxHour extends StatelessWidget {

  late List<int> previsaoTempPorHora = List.filled(8, 0);
  final List<String> imagePath;

  BoxHour({
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
          color: const Color(0x4D001026),
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
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getCurrentDate(),
                          style: const TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.white,
                          ),
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
                        Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              Text(
                                  '${previsaoTempPorHora[i]}°C',
                                  style: const TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white
                                  ),
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
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.white
                                ),

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
