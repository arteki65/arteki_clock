import 'package:arteki_clock/widget/loaction_widget.dart';
import 'package:arteki_clock/widget/weather_wdiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'state/hours_state.dart';
import 'state/minutes_state.dart';
import 'state/time_state.dart';
import 'util/debug_util.dart';
import 'widget/colon.dart';
import 'widget/day_night_indicator.dart';
import 'widget/hours_widget.dart';
import 'widget/minutes_widget.dart';
import 'widget/seconds_circle.dart';

class ArtekiClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          debug('constraints $constraints');
          debug('constraints ${MediaQuery.of(context).size}');
          return Stack(
            children: <Widget>[
              Center(
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.display4.copyWith(
                        color: Colors.blue,
                      ),
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
              Positioned(
                top: constraints.maxHeight * 0.15,
                left: 0,
                width: constraints.maxWidth,
                child: Column(
                  children: <Widget>[
                    RepaintBoundary(
                      child: WeatherWidget(),
                    ),
                    SizedBox(height: 8),
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
            ],
          );
        },
      );

  Widget _hoursBuilder(BuildContext context, HoursState state, _) {
    debug('ArtekiClock - _hoursBuilder()');
    return HoursWidget(dateTime: state.dateTime);
  }

  Widget _minutesBuilder(BuildContext context, MinutesState state, _) {
    debug('ArtekiClock - _minutesBuilder()');
    return MinutesWidget(dateTime: state.dateTime);
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
