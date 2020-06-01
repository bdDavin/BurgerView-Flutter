import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class BurgerInputField extends StatelessWidget {
  final String hintText;
  final Function(String) onChange;
  final bool autoFocus;

  BurgerInputField({this.hintText, this.autoFocus = true, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.MustardColor,
      ),
      child: TextField(
        onChanged: onChange,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        cursorColor: AppColors.TomatoColor,
        cursorWidth: 2.0,
        style: TextStyles.OpenSansBoldSize14TextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Burger name",
        ),
      ),
    );
  }
}
