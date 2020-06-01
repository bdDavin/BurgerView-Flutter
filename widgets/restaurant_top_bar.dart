import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_back_button.dart';
import 'package:BurgerViewFlutter/widgets/restaurant_search_bar.dart';
import 'package:flutter/material.dart';

class RestaurantTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Add review on burger at",
          style: TextStyles.OpenSansBoldSize14TextStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: <Widget>[
              BurgerBackButton(
                onTap: () {
                  Routes.sailor.pop();
                },
              ),
              RestaurantSearchBar(),
            ],
          ),
        ),
      ],
    );
  }
}
