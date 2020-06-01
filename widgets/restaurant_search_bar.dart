import 'package:BurgerViewFlutter/providers/restaurant_provider.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantSearchBar extends StatelessWidget {
  final String searchIcon;

  RestaurantSearchBar({this.searchIcon = AppImages.SearchIcon});

  @override
  Widget build(BuildContext context) {
    var restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);

    void _onInputChange(String input) {
      if (input == "") {
        restaurantProvider.setShowSearchedResults(false);
      } else {
        restaurantProvider.setSearchedRestaurants(input);
        restaurantProvider.setShowSearchedResults(true);
      }
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.MustardColor,
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          height: 40.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextField(
                  onChanged: _onInputChange,
                  cursorColor: AppColors.TomatoColor,
                  cursorWidth: 2.0,
                  style: TextStyles.OpenSansBoldSize14TextStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Restaurant name",
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(AppImages.SearchIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
