import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/providers/burger_filter_provider.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_list_item.dart';
import 'package:BurgerViewFlutter/widgets/image_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BurgerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BurgerFilterProvider filter = Provider.of<BurgerFilterProvider>(context);
    if (filter.burgers == null) {
      return Center(
        child: ImageSpinner(
          assetImageUrl: AppImages.BurgerLogo,
        ),
      );
    } else if (filter.burgers.length == 0) {
      return Center(
        child: Text(
          "No reviewed burgers\nPress the + to add a review",
          style: TextStyles.OpenSansBoldSize14TextStyle,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
          itemCount: filter.burgers.length,
          itemBuilder: (context, i) {
            return BurgerListItem(
              index: i + 1,
              burger: filter.burgers[i],
              onTap: (burger) {
                Routes.sailor.navigate<Burger>(
                  Routes.BurgerReviewsSceenRoute,
                  params: {"burger": burger},
                );
              },
            );
          });
    }
  }
}
