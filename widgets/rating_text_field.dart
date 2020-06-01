import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class RatingTextField extends StatelessWidget {
  final Function(String) onChanged;
  final bool extendField;

  RatingTextField({@required this.onChanged, this.extendField = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(5.0),
          color: AppColors.MustardColor,
        ),
        child: TextField(
          onChanged: onChanged,
          maxLines: extendField ? 6 : 1,
          maxLength: 250,
          maxLengthEnforced: true,
          keyboardType: TextInputType.multiline,
          cursorColor: AppColors.TomatoColor,
          cursorWidth: 2.0,
          style: TextStyles.OpenSansBoldSize14TextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Describe",
          ),
        ),
      ),
    );
  }
}
