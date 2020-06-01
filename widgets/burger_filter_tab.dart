import 'package:BurgerViewFlutter/providers/burger_filter_provider.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_input_field.dart';
import 'package:BurgerViewFlutter/widgets/burger_slider.dart';
import 'package:BurgerViewFlutter/widgets/sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BurgerFilterTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<BurgerFilterProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 60.0,
          child: Center(
            child: Text(
              "Best rated within 5 km",
              style: TextStyles.OpenSansBoldSize12TextStyle,
            ),
          ),
        ),
        Container(
          height: 1,
          color: AppColors.TextColor,
          width: MediaQuery.of(context).size.width - 60,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Rating order",
          style: TextStyles.OpenSansBoldSize12TextStyle,
        ),
        SizedBox(
          height: 8.0,
        ),
        SlidingSegmentedControl(
          onChange: (value) {
            filter.setRatingOrder(value);
          },
          children: {
            0: Text(
              "Best",
              style: TextStyles.OpenSansBoldSize12TextStyle,
            ),
            1: Text(
              "Worst",
              style: TextStyles.OpenSansBoldSize12TextStyle,
            ),
          },
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Filter by (Not implemented)",
          style: TextStyles.OpenSansBoldSize12TextStyle,
        ),
        SizedBox(
          height: 8.0,
        ),
        SlidingSegmentedControl(
          onChange: (value) {
            filter.setFilterBy(value);
          },
          children: {
            0: Text(
              "Proximity",
              style: TextStyles.OpenSansBoldSize12TextStyle,
            ),
            1: Text(
              "City",
              style: TextStyles.OpenSansBoldSize12TextStyle,
            ),
            2: Text(
              "Restaurant",
              style: TextStyles.OpenSansBoldSize12TextStyle,
            ),
          },
        ),
        SizedBox(
          height: filter.filterBy == FilterBy.proximity ? 10.0 : 30.0,
        ),
        filter.filterBy == FilterBy.proximity
            ? Text(
                "Km",
                style: TextStyles.OpenSansBoldSize12TextStyle,
              )
            : Container(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: filter.filterBy == FilterBy.proximity
              ? BurgerSlider(
                  startValue: filter.kmValue,
                  onChange: (value) {
                    filter.setKmValue(value);
                  },
                )
              : BurgerInputField(
                  hintText: "Restaurant name",
                  autoFocus: false,
                  onChange: (input) {
                    filter.setSearchInput(input);
                  },
                ),
        ),
      ],
    );
  }
}
