import 'package:flutter/material.dart';

class iconBar extends StatelessWidget {
  final IconData iconLeft = Icons.water_drop;
  final IconData iconMiddle = Icons.arrow_downward;
  final IconData iconRight = Icons.air;
  final String textLeft = '10%';
  final String textMiddle = '50%';
  final String textRight = '13 km/h';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0,0,25.0,0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(iconLeft),
                SizedBox(width: 4),
                Text(textLeft),
              ],
            ),
            Row(
              children: [
                Icon(iconMiddle),
                SizedBox(width: 4),
                Text(textMiddle),
              ],
            ),
            Row(
              children: [
                Icon(iconRight),
                SizedBox(width: 4),
                Text(textRight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}