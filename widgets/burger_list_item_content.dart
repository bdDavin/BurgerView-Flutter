import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/widgets/burger_list_item_content_body.dart';
import 'package:BurgerViewFlutter/widgets/burger_list_item_content_title.dart';
import 'package:flutter/material.dart';

class BurgerListItemContent extends StatelessWidget {
  BurgerListItemContent({
    @required this.burger,
    this.index,
  });

  final Burger burger;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: BurgerListItemContentTitle(
              burger: burger,
              index: index,
            ),
          ),
          BurgerListItemContentBody(burger: burger),
        ],
      ),
    );
  }
}
