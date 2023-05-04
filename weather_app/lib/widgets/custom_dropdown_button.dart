import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_styles.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final Function(String?) onChanged;
  final String imagePathPin = 'assets/icons/pin.png';
  final String imagePathArrow = 'assets/icons/arow_down.png';
  CustomDropdownButton({
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Row(
        children: [
          Image.asset(
            imagePathPin,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 125,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              icon: Image.asset(
                imagePathArrow,
                width: 10,
                height: 10,
              ),
              value: null,
              dropdownColor: AppColors.dropDownColor,
              hint: Text(
                hintText,
                style: AppStyles.SFw500TextStyle,
              ),
              onChanged: onChanged,
              items: items.map(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppStyles.SFw500TextStyle,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

}
