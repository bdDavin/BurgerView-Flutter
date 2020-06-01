import 'package:flutter/material.dart';

class ImageSpinner extends StatefulWidget {
  final String assetImageUrl;
  final double height;
  final double width;

  ImageSpinner({
    @required this.assetImageUrl,
    this.height = 90,
    this.width = 90,
  });

  @override
  _ImageSpinnerState createState() => _ImageSpinnerState();
}

class _ImageSpinnerState extends State<ImageSpinner>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animateRotation;
  Animation<double> animateScaleIn;
  Animation<double> animateScaleOut;

  double scale = 1.0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animateRotation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animateRotation,
      child: Transform.scale(
        scale: scale,
        child: Image.asset(
          widget.assetImageUrl,
          height: widget.height,
          width: widget.width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
