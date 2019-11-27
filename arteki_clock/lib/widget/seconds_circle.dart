import 'package:arteki_clock/clock_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SecondsCircle extends StatelessWidget {
  final DateTime _dateTime;
  final double _radius;

  const SecondsCircle({
    Key key,
    @required DateTime dateTime,
    @required double radius,
  })  : _dateTime = dateTime,
        _radius = radius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = ClockThemeData.of(context);
    return CircularPercentIndicator(
      radius: _radius,
      percent: _dateTime.second == 59
          ? (_dateTime.second + 0.7) / 60
          : (_dateTime.second + 1) / 60,
      animation: true,
      animateFromLastPercent: true,
      circularStrokeCap: CircularStrokeCap.round,
      lineWidth: 10,
      animationDuration: 1000,
      backgroundColor: themeData.secondaryColor,
      progressColor: themeData.primaryColor,
    );
  }
}
