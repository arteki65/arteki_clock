import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/clock_settings_state.dart';
import 'state/hours_state.dart';
import 'state/minutes_state.dart';
import 'state/seconds_state.dart';

class ArtekiClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClockSettingsState>(
      builder: _clockBuilder,
    );
  }

  Widget _clockBuilder(BuildContext context, ClockSettingsState state, _) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(state.model.unitString),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RepaintBoundary(
                  child: Consumer<HoursState>(builder: _hoursBuilder)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(':'),
              ),
              RepaintBoundary(
                  child: Consumer<MinutesState>(builder: _minutesBuilder)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(':'),
              ),
              RepaintBoundary(
                  child: Consumer<SecondsState>(builder: _secondsBuilder)),
            ],
          ),
        ],
      );

  Widget _hoursBuilder(BuildContext context, HoursState state, _) =>
      Text(state.dateTime.hour.toString());

  Widget _minutesBuilder(BuildContext context, MinutesState state, _) =>
      Text(state.dateTime.minute.toString());

  Widget _secondsBuilder(BuildContext context, SecondsState state, _) =>
      Text(state.dateTime.second.toString());
}
