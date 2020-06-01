import 'package:BurgerViewFlutter/models/review.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewListItem extends StatefulWidget {
  final Review review;

  ReviewListItem(this.review);

  @override
  _ReviewListItemState createState() => _ReviewListItemState();
}

class _ReviewListItemState extends State<ReviewListItem>
    with TickerProviderStateMixin {
  bool _expanded = false;
  final animDuration = 300;

  void toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleExpanded();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              height: 2.0,
              color: AppColors.TextColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.review.user,
                    style: TextStyles.OpenSansBoldSize12TextStyle),
                Text(
                    "Bun " +
                        widget.review.bunScore.toString() +
                        "/10 | Toppings " +
                        widget.review.toppingsScore.toString() +
                        "/10 | Puck " +
                        widget.review.puckScore.toString() +
                        "/10",
                    style: TextStyles.OpenSansBoldSize12TextStyle),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              bottom: _expanded ? 8.0 : 0.0,
            ),
            child: widget.review.imageURL != null
                ? AnimatedContainer(
                    height: _expanded ? 150.0 : 0.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.review.imageURL,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    duration: Duration(
                      milliseconds: animDuration,
                    ),
                  )
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              bottom: 4.0,
            ),
            child: AnimatedSize(
              duration: Duration(milliseconds: animDuration),
              vsync: this,
              child: Text(
                widget.review.description,
                maxLines: _expanded ? null : 3,
                overflow: _expanded ? null : TextOverflow.ellipsis,
                style: TextStyles.OpenSansSemiBoldSize10TextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              bottom: 4.0,
            ),
            child: Text(
              DateFormat('MMMM y', 'en_US')
                  .format(widget.review.timestamp.toDate()),
              style: TextStyles.OpenSansBoldSize10TextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
