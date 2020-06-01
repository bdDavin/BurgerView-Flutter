import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class BurgerListItemContentTitle extends StatelessWidget {
  BurgerListItemContentTitle({
    @required this.burger,
    @required this.index,
  });

  final Burger burger;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        index == null
            ? Container()
            : Text(
                index.toString() + ".",
                style: TextStyles.ConcertOneSize30TextStyle,
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: Text(burger.burgerName,
                  style: TextStyles.ConcertOneSize24TextStyle),
            ),
            Text(burger.restaurantName,
                style: TextStyles.OpenSansBoldSize10TextStyle),
          ],
        ),
      ],
    );
  }
}
