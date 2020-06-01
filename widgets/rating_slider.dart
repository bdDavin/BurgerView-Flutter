import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RatingSlider extends StatefulWidget {
  final Function(double) onChange;
  double value;

  RatingSlider({
    @required this.onChange,
    this.value,
  });
  @override
  _RatingSliderState createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  List<FlutterSliderHatchMarkLabel> stepMarks = [];
  List<Map<dynamic, dynamic>> stepMarksText = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      stepMarksText.add({"percent": i * 100 / 9, "label": (i + 1).toString()});
    }
    stepMarks = _stepMarks();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      values: [widget.value],
      max: 10,
      min: 1,
      onDragging: (handlerIndex, lowerValue, upperValue) {
        widget.value = lowerValue;
        setState(() {});
        widget.onChange(widget.value);
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
            widget.value == 5.5 ? "" : widget.value.toStringAsFixed(0),
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
      if (stepMark['percent'] == 0 || stepMark['percent'] == 100) {
        newStepMarks.add(
          FlutterSliderHatchMarkLabel(
            percent: stepMark['percent'],
            label: Container(
              height: 30.0,
              width: 30.0,
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
      } else {
        newStepMarks.add(
          FlutterSliderHatchMarkLabel(
            percent: stepMark['percent'],
            label: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.MustardColor,
              ),
            ),
          ),
        );
      }
    }
    return newStepMarks;
  }
}
