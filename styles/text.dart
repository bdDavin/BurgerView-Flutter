import 'package:flutter/material.dart';
import 'colors.dart';

abstract class TextStyles {
  static const ConcertOneSize24TextStyle = TextStyle(
    color: AppColors.TextColor,
    fontFamily: "Concert One",
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const ConcertOneSize30TextStyle = TextStyle(
    color: AppColors.TextColor,
    fontFamily: "Concert One",
    fontSize: 30.0,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );
  static const OpenSansBoldSize10TextStyle = TextStyle(
    color: AppColors.TextColor,
    fontFamily: "Open Sans",
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );
  static const OpenSansBoldSize12TextStyle = TextStyle(
    color: AppColors.TextColor,
    fontFamily: "Open Sans",
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );
  static const OpenSansBoldSize14TextStyle = TextStyle(
    color: AppColors.TextColor,
    fontFamily: "Open Sans",
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );
  static const OpenSansSemiBoldSize10TextStyle = TextStyle(
    color: AppColors.TextColor,
    fontFamily: "Open Sans",
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );
  static const OpenSansExtraBoldSize18TextStyle = TextStyle(
    color: AppColors.TomatoColor,
    fontFamily: "Open Sans",
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    decoration: TextDecoration.none,
  );
}
