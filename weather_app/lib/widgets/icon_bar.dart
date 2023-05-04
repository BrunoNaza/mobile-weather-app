import 'package:flutter/material.dart';
import 'package:weather_app/themes/app_colors.dart';
import 'package:weather_app/themes/app_styles.dart';

class IconBar extends StatelessWidget {
  final String imagePathHumidity = 'assets/icons/humidity.png';
  final String imagePathPop = 'assets/icons/pop.png';
  final String imagePathWind = 'assets/icons/wind.png';
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
          color: AppColors.decorationWidgets,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePathPop,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 4),
                Text(
                  textLeft,
                  style: AppStyles.boldSF14TextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  imagePathHumidity,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 4),
                Text(
                  textMiddle,
                  style: AppStyles.boldSF14TextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  imagePathWind,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 4),
                Text(
                  textRight,
                  style: AppStyles.boldSF14TextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}