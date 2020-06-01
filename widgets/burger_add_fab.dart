import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonIcon;

  CircularButton({
    @required this.onPressed,
    this.buttonIcon = AppImages.Plus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.MustardColor,
        foregroundColor: AppColors.TomatoColor,
        child: Image(
          image: AssetImage(AppImages.Plus),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          side: BorderSide(
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
