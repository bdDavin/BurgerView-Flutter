import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:BurgerViewFlutter/services/database_service.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/add_burger_bottomsheet.dart';
import 'package:BurgerViewFlutter/widgets/burger_back_button.dart';
import 'package:BurgerViewFlutter/widgets/burger_long_add_button.dart';
import 'package:flutter/material.dart';

class BurgerMenuTopBar extends StatelessWidget {
  final Restaurant restaurant;

  BurgerMenuTopBar(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Select burger to review",
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    restaurant.name,
                    style: TextStyles.ConcertOneSize24TextStyle,
                  ),
                ),
              ),
              BurgerLongAddButton(
                  text: "New",
                  enabled: true,
                  onTap: () {
                    _showModal(context);
                  }),
            ],
          ),
        ),
      ],
    );
  }

  _showModal(BuildContext context) async {
    final result = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return AddBurgerBottomSheet();
        });
    if (result != "" && result != null) {
      DatabaseService().uploadNewBurger(result, restaurant);
    }
  }
}
