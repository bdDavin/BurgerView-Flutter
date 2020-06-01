import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/providers/new_review_provider.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/review_rating_body.dart';
import 'package:BurgerViewFlutter/widgets/review_rating_bottom_controls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

class AddReviewRatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Burger burger = Sailor.param<Burger>(
      context,
      'burger',
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              NewReviewProvider(burgerDocumentId: burger.documentId),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.PrimaryBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: Text(
                    "Reviewing ${burger.burgerName} at ${burger.restaurantName}",
                    textAlign: TextAlign.center,
                    style: TextStyles.OpenSansBoldSize14TextStyle,
                  ),
                ),
                ReviewRatingBody(),
                ReviewRatingBottomControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
