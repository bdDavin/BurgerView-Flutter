import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantListItem({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.sailor.navigate(
          Routes.AddReviewBurgerSceenRoute,
          params: {"restaurant": restaurant},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: Container(
              height: 2.0,
              color: AppColors.TextColor,
            ),
          ),
          Text(
            restaurant.name,
            style: TextStyles.ConcertOneSize24TextStyle,
          ),
          Text(
            restaurant.address,
            style: TextStyles.OpenSansBoldSize10TextStyle,
          ),
        ],
      ),
    );
  }
}
