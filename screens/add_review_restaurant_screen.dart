import 'package:BurgerViewFlutter/providers/restaurant_provider.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/widgets/restaurant_list.dart';
import 'package:BurgerViewFlutter/widgets/restaurant_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewRestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => RestaurantProvider(),
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
            child: Column(
              children: <Widget>[
                RestaurantTopBar(),
                RestaurantList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
