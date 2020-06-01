import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidingSegmentedControl extends StatefulWidget {
  final Map<int, Widget> children;
  final Function(int) onChange;

  SlidingSegmentedControl({
    @required this.children,
    @required this.onChange,
  });
  @override
  _SlidingSegmentedControlState createState() =>
      _SlidingSegmentedControlState();
}

class _SlidingSegmentedControlState extends State<SlidingSegmentedControl> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      thumbColor: AppColors.TomatoColor,
      backgroundColor: AppColors.MustardColor,
      groupValue: _value,
      onValueChanged: (value) {
        setState(() {
          _value = value;
        });
        widget.onChange(value);
      },
      children: widget.children,
    );
  }
}
