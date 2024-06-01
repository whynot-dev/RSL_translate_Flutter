import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';

class CircularProgress extends StatefulWidget {
  CircularProgress({
    this.size = 24,
    this.secondaryColor = AppColors.black,
    this.primaryColor = AppColors.black,
    this.lapDuration = 1000,
    this.strokeWidth = 3.3,
  });

  final double size;
  final Color secondaryColor;
  final Color? primaryColor;
  final int lapDuration;
  final double strokeWidth;

  @override
  _CircularProgress createState() => new _CircularProgress();
}

class _CircularProgress extends State<CircularProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: widget.lapDuration))..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(controller),
      child: CustomPaint(
        painter: CirclePaint(
            progress: controller.value,
            secondaryColor: widget.secondaryColor,
            primaryColor: widget.primaryColor ?? AppColors.black,
            strokeWidth: widget.strokeWidth),
        size: Size(widget.size, widget.size),
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  final Color secondaryColor;
  final Color primaryColor;
  final double strokeWidth;
  final double progress;

  double _degreeToRad(double degree) => degree * math.pi / 180;

  CirclePaint({
    this.progress = 1,
    this.secondaryColor = Colors.grey,
    this.primaryColor = Colors.blue,
    this.strokeWidth = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double centerPoint = size.height / 2;

    Paint paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // paint.shader = SweepGradient(
    //   colors: [primaryColor, primaryColor],
    //   tileMode: TileMode.repeated,
    //   startAngle: _degreeToRad(270),
    //   endAngle: _degreeToRad(270 + 360.0),
    // ).createShader(Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    var scapSize = strokeWidth * 0.70;
    double scapToDegree = scapSize / centerPoint;
// 2
    double startAngle = _degreeToRad(0); // + scapToDegree;
    double sweepAngle = _degreeToRad(360); // - (2 * scapToDegree);

    canvas.drawArc(
        Offset(0.0, 0.0) & Size(size.width, size.width), 0, 3 * math.pi / 2, false, paint..color = primaryColor);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
    return true;
  }
}
