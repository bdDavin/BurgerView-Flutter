import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class RateText extends StatelessWidget {
  final smallText;
  final bigText;

  RateText({
    @required this.smallText,
    @required this.bigText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            smallText,
            textAlign: TextAlign.center,
            style: TextStyles.OpenSansBoldSize14TextStyle,
          ),
          SizedBox(
            width: 3.0,
          ),
          Text(
            bigText,
            style: TextStyles.ConcertOneSize24TextStyle,
          ),
        ],
      ),
    );
  }
}
