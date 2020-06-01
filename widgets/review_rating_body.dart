import 'dart:async';

import 'package:BurgerViewFlutter/providers/new_review_provider.dart';
import 'package:BurgerViewFlutter/widgets/rate_text.dart';
import 'package:BurgerViewFlutter/widgets/rating_slider.dart';
import 'package:BurgerViewFlutter/widgets/rating_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class ReviewRatingBody extends StatefulWidget {
  @override
  _ReviewRatingBodyState createState() => _ReviewRatingBodyState();
}

class _ReviewRatingBodyState extends State<ReviewRatingBody> {
  bool _showImage = true;

  StreamSubscription<bool> keyboardVisi;

  @override
  void initState() {
    super.initState();
    keyboardVisi = KeyboardVisibility.onChange.listen((bool visible) {
      setState(() {
        _showImage = !visible;
      });
    });
  }

  @override
  void dispose() {
    keyboardVisi.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var newReviewProvider = Provider.of<NewReviewProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _showImage
            ? newReviewProvider.image != null && newReviewProvider.isLastStep
                ? Container(
                    height: 260,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.file(
                      newReviewProvider.image,
                      fit: BoxFit.cover,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      if (newReviewProvider.isLastStep) {
                        //Add image
                        newReviewProvider.setImage(() {
                          setState(() {});
                        });
                      }
                    },
                    child: Image.asset(
                      newReviewProvider.stepBurgerImage(),
                    ),
                  )
            : Container(),
        SizedBox(
          height: 20.0,
        ),
        RateText(
          smallText: newReviewProvider.stepRateTextSmall(),
          bigText: newReviewProvider.stepRateTextBig(),
        ),
        newReviewProvider.step == NewReviewStep.description
            ? RatingTextField(
                extendField: !_showImage,
                onChanged: (input) {
                  newReviewProvider.setRating(input);
                },
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: RatingSlider(
                  value: newReviewProvider.sliderValue(),
                  onChange: (value) {
                    newReviewProvider.setRating(value);
                  },
                ),
              ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
