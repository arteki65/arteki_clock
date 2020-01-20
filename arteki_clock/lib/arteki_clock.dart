import 'package:arteki_clock/widget/extra_info/extra_info_display.dart';
import 'package:arteki_clock/widget/time/am_pm_display.dart';
import 'package:arteki_clock/widget/time/seconds_indicator.dart';
import 'package:arteki_clock/widget/time/time_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'clock_theme_data.dart';

class ArtekiClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = ClockThemeData.of(context);
    return LayoutBuilder(
      builder: (context, constraints) =>
          _layoutBuilder(context, constraints, themeData),
    );
  }

  Widget _layoutBuilder(BuildContext context, BoxConstraints constraints,
      ClockThemeData themeData) {
    final verticalPadding = constraints.maxHeight * 0.15;

    return Stack(
      children: <Widget>[
        Center(child: TimeDisplay()),
        Center(
          child: SecondsIndicator(constraints: constraints),
        ),
        Positioned(
          bottom: verticalPadding,
          left: 0,
          width: constraints.maxWidth,
          child: AmPmDisplay(),
        ),
        Positioned(
          top: verticalPadding,
          left: 0,
          width: constraints.maxWidth,
          child: ExtraInfoDisplay(constraints: constraints),
        ),
      ],
    );
  }
}
