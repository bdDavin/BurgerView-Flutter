import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayTopControls extends StatefulWidget {
  final bool fadeIn;

  OverlayTopControls({this.fadeIn = true});
  @override
  _OverlayTopControlsState createState() => _OverlayTopControlsState();
}

class _OverlayTopControlsState extends State<OverlayTopControls> {
  bool visible = false;
  int _value = 0;

  @override
  void initState() {
    super.initState();
    if (widget.fadeIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) => fadeInTopControls());
    } else {
      visible = true;
    }
  }

  void fadeInTopControls() {
    setState(() {
      visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BurgerBackButton(
            onTap: () {
              Routes.sailor.pop();
            },
          ),
          CupertinoSlidingSegmentedControl(
            thumbColor: AppColors.TomatoColor,
            backgroundColor: AppColors.MustardColor,
            groupValue: _value,
            onValueChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            children: {
              0: Text(
                "Ascending",
                style: TextStyles.OpenSansBoldSize12TextStyle,
              ),
              1: Text(
                "Descending",
                style: TextStyles.OpenSansBoldSize12TextStyle,
              ),
            },
          )
          // SegmentedOrderControl(
          //   leftText: "Added",
          //   rightText: "Asc",
          // ),
        ],
      ),
    );
  }
}
