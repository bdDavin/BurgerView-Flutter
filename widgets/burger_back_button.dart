import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:flutter/material.dart';

class BurgerBackButton extends StatelessWidget {
  final Function() onTap;
  BurgerBackButton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 47,
        decoration: BoxDecoration(
          color: AppColors.MustardColor,
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(30.0),
          ),
          image: DecorationImage(
            image: AssetImage(AppImages.LeftArrow),
          ),
        ),
      ),
    );
  }
}
