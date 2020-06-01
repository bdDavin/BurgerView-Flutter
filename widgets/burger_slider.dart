import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class BurgerSlider extends StatefulWidget {
  final Function(double) onChange;
  final double startValue;

  BurgerSlider({
    this.onChange,
    this.startValue,
  });
  @override
  _BurgerSliderState createState() => _BurgerSliderState();
}

class _BurgerSliderState extends State<BurgerSlider> {
  List<FlutterSliderHatchMarkLabel> stepMarks = [];
  List<Map<dynamic, dynamic>> stepMarksText = [];
  double _lowerValue;

  @override
  void initState() {
    super.initState();
    _lowerValue = widget.startValue;
    for (int i = 0; i < 5; i++) {
      stepMarksText
          .add({"percent": i * 100 / 4, "label": ((i + 1) * 5).toString()});
    }
    stepMarks = _stepMarks();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      values: [_lowerValue],
      max: 5,
      min: 1,
      onDragging: (handlerIndex, lowerValue, upperValue) {
        _lowerValue = lowerValue;
        setState(() {});
        widget.onChange(_lowerValue);
      },
      tooltip: FlutterSliderTooltip(
        disabled: true,
      ),
      trackBar: FlutterSliderTrackBar(
        activeTrackBarHeight: 10.0,
        inactiveTrackBarHeight: 10.0,
        inactiveTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.MustardColor,
        ),
        activeTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.MustardColor,
        ),
      ),
      hatchMark: FlutterSliderHatchMark(
        labels: stepMarks,
        labelsDistanceFromTrackBar: 1.2,
        linesAlignment: FlutterSliderHatchMarkAlignment.right,
        density: 0.5,
      ),
      handler: FlutterSliderHandler(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.TomatoColor,
        ),
        child: Center(
          child: Text(
            (_lowerValue * 5).toStringAsFixed(0),
            style: TextStyles.OpenSansBoldSize14TextStyle,
          ),
        ),
      ),
      handlerAnimation: FlutterSliderHandlerAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.bounceIn,
          duration: Duration(milliseconds: 500),
          scale: 1.5),
    );
  }

  List<FlutterSliderHatchMarkLabel> _stepMarks() {
    List<FlutterSliderHatchMarkLabel> newStepMarks = [];
    for (Map<dynamic, dynamic> stepMark in stepMarksText) {
      newStepMarks.add(
        FlutterSliderHatchMarkLabel(
          percent: stepMark['percent'],
          label: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.MustardColor,
            ),
            child: Center(
              child: Text(
                stepMark['label'],
                style: TextStyles.OpenSansBoldSize14TextStyle,
              ),
            ),
          ),
        ),
      );
    }
    return newStepMarks;
  }
}
