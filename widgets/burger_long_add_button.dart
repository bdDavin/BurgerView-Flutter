import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class BurgerLongAddButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final bool enabled;

  BurgerLongAddButton({this.text, this.onTap, this.enabled = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 40.0,
        width: 80.0,
        decoration: BoxDecoration(
          border: enabled
              ? Border.all(width: 2.0)
              : Border.all(
                  width: 2.0,
                  color: Colors.black.withOpacity(0.5),
                ),
          color: enabled
              ? AppColors.MustardColor
              : AppColors.MustardColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: enabled
                ? TextStyles.OpenSansExtraBoldSize18TextStyle
                : TextStyles.OpenSansExtraBoldSize18TextStyle.copyWith(
                    color: AppColors.TomatoColor.withOpacity(0.5),
                  ),
          ),
        ),
      ),
    );
  }
}
