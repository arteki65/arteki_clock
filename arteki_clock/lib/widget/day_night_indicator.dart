import 'package:arteki_clock/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../state/clock_settings_state.dart';

class DayNightIndicator extends StatelessWidget {
  final DateTime _dateTime;

  const DayNightIndicator({
    Key key,
    @required DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debug('${this.runtimeType} build()');
    return Consumer<ClockSettingsState>(
      builder: _dayNightIndicatorBuilder,
    );
  }

  Widget _dayNightIndicatorBuilder(
      BuildContext context, ClockSettingsState state, _) {
    debug('${this.runtimeType} _dayNightIndicatorBuilder()');
    if (state.model.is24HourFormat) {
      return Container();
    }
    return Text(
      DateFormat('a').format(_dateTime),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.display3,
    );
  }
}
