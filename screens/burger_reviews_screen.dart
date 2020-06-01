import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/services/database_service.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/widgets/burger_info_sliver_header.dart';
import 'package:BurgerViewFlutter/widgets/burger_reviews_screen_controls_overlay.dart';
import 'package:BurgerViewFlutter/widgets/reviews_list.dart';
import 'package:BurgerViewFlutter/widgets/reviews_sliver_top_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

class BurgerReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Burger burger = Sailor.param<Burger>(context, 'burger');
    final _db = DatabaseService();

    return MultiProvider(
      providers: [
        StreamProvider(
          create: (BuildContext context) =>
              _db.streamBurgerReviews(burger.documentId),
        ),
      ],
      child: Scaffold(
          backgroundColor: AppColors.PrimaryBackgroundColor,
          body: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  ReviewsSliverTopImage(burger: burger),
                  BurgerInfoSliverHeader(burger: burger),
                  ReviewsList(),
                ],
              ),
              BurgerReviewsScreenControlsOverlay(onAddPressed: () {
                Routes.sailor.navigate(Routes.AddReviewRateSceenRoute, params: {
                  "burger": burger,
                });
              }),
            ],
          )),
    );
  }
}
