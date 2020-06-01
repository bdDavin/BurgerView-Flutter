import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class BurgerListItemContentBody extends StatelessWidget {
  const BurgerListItemContentBody({
    @required this.burger,
  });

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(AppImages.BurgerLogo),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bun " + burger.averageBunScore + "/10",
                    style: TextStyles.OpenSansBoldSize14TextStyle,
                  ),
                  Text(
                    "Toppings " + burger.averageToppingsScore + "/10",
                    style: TextStyles.OpenSansBoldSize14TextStyle,
                  ),
                  Text(
                    "Puck " + burger.averagePuckScore + "/10",
                    style: TextStyles.OpenSansBoldSize14TextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          burger.numberOfReviews.toString() + " Reviews",
          style: TextStyles.OpenSansBoldSize12TextStyle,
        ),
      ],
    );
  }
}
