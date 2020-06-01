import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:BurgerViewFlutter/services/database_service.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_menu_list.dart';
import 'package:BurgerViewFlutter/widgets/burger_menu_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

class AddReviewBurgerScreen extends StatelessWidget {
  final _db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant =
        Sailor.param<Restaurant>(context, 'restaurant');
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (BuildContext context) =>
              _db.streamRestaurantMenu(restaurant.googleId),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.PrimaryBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              left: 30.0,
              right: 30.0,
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    BurgerMenuTopBar(restaurant),
                    Text(
                      "Menu",
                      style: TextStyles.OpenSansBoldSize14TextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    BurgerMenuList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
