import 'package:BurgerViewFlutter/providers/restaurant_provider.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/image_spinner.dart';
import 'package:BurgerViewFlutter/widgets/restaurant_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var restaurantProvider = Provider.of<RestaurantProvider>(context);
    var showSearchedResults = restaurantProvider.showSearchedResults;
    var restaurants = showSearchedResults
        ? restaurantProvider.searchedRestaurants
        : restaurantProvider.nearbyRestaurants;
    if (restaurants == []) {
      return Padding(
        padding: EdgeInsets.only(top: 40.0),
        child: ImageSpinner(
          assetImageUrl: AppImages.BurgerLogo,
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: restaurants.length + 2,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Center(
              child: Text(
                showSearchedResults ? "Search" : "Nearby",
                style: TextStyles.OpenSansBoldSize14TextStyle,
              ),
            );
          } else if (i == restaurants.length + 1) {
            return Container(
              height: 5.0,
              color: AppColors.PrimaryBackgroundColor,
            );
          } else {
            return RestaurantListItem(
              restaurant: restaurants[i - 1],
            );
          }
        },
      ),
    );
  }
}
