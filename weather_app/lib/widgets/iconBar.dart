import 'package:flutter/material.dart';

class IconBar extends StatelessWidget {
  final IconData iconLeft = Icons.water_drop;
  final IconData iconMiddle = Icons.thermostat_rounded;
  final IconData iconRight = Icons.air;
  final String textLeft ;
  final String textMiddle ;
  final String textRight ;

  IconBar({
    required this.textLeft,
    required this.textMiddle,
    required this.textRight,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0x4D001026),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(iconLeft),
                SizedBox(width: 4),
                Text(
                  textLeft,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(iconMiddle),
                SizedBox(width: 4),
                Text(
                  textMiddle,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(iconRight),
                SizedBox(width: 4),
                Text(
                  textRight,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}