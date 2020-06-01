import 'package:BurgerViewFlutter/widgets/burger_add_fab.dart';
import 'package:flutter/material.dart';

import 'overlay_top_controls.dart';

class BurgerReviewsScreenControlsOverlay extends StatelessWidget {
  final Function onAddPressed;

  BurgerReviewsScreenControlsOverlay({@required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            OverlayTopControls(),
            CircularButton(
              onPressed: onAddPressed,
            ),
          ],
        ),
      ),
    );
  }
}
