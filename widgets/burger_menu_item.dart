import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class BurgerMenuItem extends StatelessWidget {
  final Burger burger;

  BurgerMenuItem({@required this.burger});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.sailor.navigate(Routes.AddReviewRateSceenRoute, params: {
          "burger": burger,
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              height: 2.0,
              color: AppColors.TextColor,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            burger.burgerName,
            style: TextStyles.ConcertOneSize24TextStyle,
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
