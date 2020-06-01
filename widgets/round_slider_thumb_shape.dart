import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomSliderTickMarkShape extends SliderTickMarkShape {
  final double radius;
  const CustomSliderTickMarkShape({
    @required this.radius,
  });

  @override
  Size getPreferredSize({SliderThemeData sliderTheme, bool isEnabled}) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    Animation<double> enableAnimation,
    Offset thumbCenter,
    bool isEnabled,
    TextDirection textDirection,
  }) {
    final Canvas canvas = context.canvas;
    final paint = Paint()
      ..color = AppColors.MustardColor
      ..style = PaintingStyle.fill;

    String text = "";
    double doubleRadius = 1;

    if (center.dx < 30) {
      text = "1";
      doubleRadius = 1.5;
    } else if (center.dx > 360) {
      text = "10";
      doubleRadius = 1.5;
    }
    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w700,
        color: AppColors.TextColor,
      ),
      text: text,
    );
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, radius * 3.5 * doubleRadius, paint);
    tp.paint(canvas, textCenter);
    //canvas.drawCircle(center, radius * 4, paint);
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;

  const CustomSliderThumbCircle({
    @required this.thumbRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = AppColors.TomatoColor
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * 1.3,
        fontWeight: FontWeight.w700,
        color: AppColors.TextColor,
      ),
      text: getValue(value),
    );

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * 1.1, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    if (value == 0.0) {
      return "1";
    }
    if (value == 0.5) {
      return "";
    }
    return (value * 10).ceil().toString();
  }
}
