import 'package:BurgerViewFlutter/providers/new_review_provider.dart';
import 'package:BurgerViewFlutter/widgets/burger_back_button.dart';
import 'package:BurgerViewFlutter/widgets/burger_long_add_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewRatingBottomControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newReviewProvider = Provider.of<NewReviewProvider>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BurgerBackButton(onTap: () {
            newReviewProvider.previusStep();
          }),
          BurgerLongAddButton(
            text: newReviewProvider.isLastStep ? "Post" : "Next",
            enabled: newReviewProvider.stepAnswered(),
            onTap: () {
              newReviewProvider.nextStep(context);
            },
          )
        ],
      ),
    );
  }
}
