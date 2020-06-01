import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.sailor.pop();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.MustardColor,
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Image.asset(AppImages.CancelIcon),
        ),
      ),
    );
  }
}
