import 'package:arteki_clock/widget/extra_info/extra_info_display.dart';
import 'package:arteki_clock/widget/time/am_pm_display.dart';
import 'package:arteki_clock/widget/time/seconds_indicator.dart';
import 'package:arteki_clock/widget/time/time_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'clock_theme_data.dart';
import 'state/hours_state.dart';
import 'state/minutes_state.dart';
import 'util/debug_util.dart';

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
    debug('$runtimeType _layoutBuilder() with constraints $constraints');
    final minutesState = Provider.of<MinutesState>(context, listen: false);
    final hoursState = Provider.of<HoursState>(context, listen: false);

    return Stack(
      children: <Widget>[
        Center(child: TimeDisplay()),
        Center(
          child: SecondsIndicator(constraints: constraints),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.15,
          left: 0,
          width: constraints.maxWidth,
          child: AmPmDisplay(),
        ),
        Positioned(
          top: constraints.maxHeight * 0.15,
          left: 0,
          width: constraints.maxWidth,
          child: ExtraInfoDisplay(constraints: constraints),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: FlatButton(
            child: Text('minutes update'),
            onPressed: () {
              minutesState.manualUpdate();
              hoursState.manualUpdate();
            },
          ),
        ),
      ],
    );
  }
}
