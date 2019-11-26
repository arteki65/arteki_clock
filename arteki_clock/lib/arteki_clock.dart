import 'package:arteki_clock/widget/eight_segment_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'state/hours_state.dart';
import 'state/minutes_state.dart';
import 'state/time_state.dart';
import 'util/debug_util.dart';
import 'widget/animated_digits.dart';
import 'widget/colon.dart';
import 'widget/day_night_indicator.dart';
import 'widget/hours_widget.dart';
import 'widget/loaction_widget.dart';
import 'widget/minutes_widget.dart';
import 'widget/seconds_circle.dart';
import 'widget/weather_wdiget.dart';

class ArtekiClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EightSegmentDisplay(
      height: 100,
      width: 50,
    );
    final minutesState = Provider.of<MinutesState>(context, listen: false);
    final hoursState = Provider.of<HoursState>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) {
        debug('$runtimeType LayoutBuilder() with constraints $constraints');
        return DefaultTextStyle(
          style: Theme.of(context).textTheme.display4.copyWith(
                color: Colors.blue,
                fontFamily: 'Cute Font',
              ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RepaintBoundary(
                      child: Consumer<HoursState>(builder: _hoursBuilder),
                    ),
                    Colon(),
                    RepaintBoundary(
                      child: Consumer<MinutesState>(builder: _minutesBuilder),
                    ),
                  ],
                ),
              ),
              Center(
                child: RepaintBoundary(
                  child: Consumer<TimeState>(
                    builder: (context, state, _) =>
                        _secondsBuilder(state, constraints),
                  ),
                ),
              ),
              Positioned(
                bottom: constraints.maxHeight * 0.15,
                left: 0,
                width: constraints.maxWidth,
                child: RepaintBoundary(
                  child: Consumer<HoursState>(
                    builder: _dayNightIndicatorBuilder,
                  ),
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontFamily: 'Cute Font', height: 0.9),
                child: Positioned(
                  top: constraints.maxHeight * 0.15,
                  left: 0,
                  width: constraints.maxWidth,
                  child: Column(
                    children: <Widget>[
                      RepaintBoundary(
                        child: WeatherWidget(),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxHeight * 0.7,
                        ),
                        child: RepaintBoundary(
                          child: LocationWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
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
          ),
        );
      },
    );
  }

  Widget _hoursBuilder(BuildContext context, HoursState state, _) {
    debug('ArtekiClock - _hoursBuilder()');
    return AnimatedDigits(
      dateTime: state.dateTime,
      builder: (dateTime) => HoursWidget(dateTime: dateTime),
    );
  }

  Widget _minutesBuilder(BuildContext context, MinutesState state, _) {
    debug('ArtekiClock - _minutesBuilder()');
    return AnimatedDigits(
      dateTime: state.dateTime,
      builder: (dateTime) => MinutesWidget(dateTime: dateTime),
    );
  }

  Widget _secondsBuilder(TimeState state, BoxConstraints constraints) {
    return SecondsCircle(
      dateTime: state.dateTime,
      radius: constraints.maxHeight * 0.95,
    );
  }

  Widget _dayNightIndicatorBuilder(BuildContext context, HoursState state, _) {
    debug('ArtekiClock - _dayNightIndicatorBuilder()');
    return DayNightIndicator(dateTime: state.dateTime);
  }
}
