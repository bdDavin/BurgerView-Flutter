import 'package:BurgerViewFlutter/models/review.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/image_spinner.dart';
import 'package:BurgerViewFlutter/widgets/review_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Review> reviews = Provider.of<List<Review>>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          if (reviews == null) {
            return Center(
              child: ImageSpinner(
                assetImageUrl: AppImages.BurgerLogo,
              ),
            );
          } else if (reviews.length == 0) {
            return Center(
              child: Text(
                "Something went wrong please go back an try again",
                style: TextStyles.OpenSansBoldSize14TextStyle,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ReviewListItem(reviews[i]);
          }
        },
        childCount: reviews == null ? 1 : reviews.length,
      ),
    );
  }
}
