import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BurgerMenuList extends StatefulWidget {
  @override
  _BurgerMenuListState createState() => _BurgerMenuListState();
}

class _BurgerMenuListState extends State<BurgerMenuList> {
  @override
  Widget build(BuildContext context) {
    var burgers = Provider.of<List<Burger>>(context);

    if (burgers == null || burgers.length == 0) {
      return Center(
        child: Text(
          "No burgers on the menu\nadd one by pressing new above",
          textAlign: TextAlign.center,
          style: TextStyles.OpenSansBoldSize12TextStyle,
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: burgers.length,
          itemBuilder: (context, i) {
            return BurgerMenuItem(burger: burgers[i]);
          },
        ),
      );
    }
  }
}
