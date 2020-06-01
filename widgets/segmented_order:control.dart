import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';

class SegmentedOrderControl extends StatefulWidget {
  final String leftText;
  final String centerText;
  final String rightText;

  SegmentedOrderControl({
    this.leftText,
    this.centerText,
    this.rightText,
  });

  @override
  _SegmentedOrderControlState createState() => _SegmentedOrderControlState();
}

class _SegmentedOrderControlState extends State<SegmentedOrderControl> {
  int _orderTab = 0;
  final _animDuration = 150;
  final _textPadding = 15.0;

  void _changeOrder(int tab) {
    setState(() {
      _orderTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _changeOrder(0);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: _animDuration),
              curve: Curves.easeInBack,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _textPadding),
                child: Center(
                  child: Text(
                    widget.leftText,
                    style: TextStyles.OpenSansBoldSize10TextStyle,
                  ),
                ),
              ),
              height: 40,
              decoration: BoxDecoration(
                color: _orderTab == 0
                    ? AppColors.TomatoColor
                    : AppColors.MustardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          widget.centerText == null ? Container() : _buildMiddleTab(),
          GestureDetector(
            onTap: () {
              _changeOrder(2);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: _animDuration),
              curve: Curves.easeInBack,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _textPadding),
                child: Center(
                  child: Text(
                    widget.leftText,
                    style: TextStyles.OpenSansBoldSize10TextStyle,
                  ),
                ),
              ),
              height: 40,
              decoration: BoxDecoration(
                color: _orderTab == 2
                    ? AppColors.TomatoColor
                    : AppColors.MustardColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleTab() {
    return Row(
      children: <Widget>[
        Container(
          height: 40,
          width: 2,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            _changeOrder(1);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: _animDuration),
            curve: Curves.easeInBack,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _textPadding),
              child: Center(
                child: Text(
                  widget.rightText,
                  style: TextStyles.OpenSansBoldSize10TextStyle,
                ),
              ),
            ),
            height: 40,
            color:
                _orderTab == 1 ? AppColors.TomatoColor : AppColors.MustardColor,
          ),
        ),
        Container(
          height: 40,
          width: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}
