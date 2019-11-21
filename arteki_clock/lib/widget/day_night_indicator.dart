import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../state/hour_format_state.dart';
import '../util/debug_util.dart';

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
    return Consumer<HourFormatState>(
      builder: _dayNightIndicatorBuilder,
    );
  }

  Widget _dayNightIndicatorBuilder(
      BuildContext context, HourFormatState state, _) {
    debug('${this.runtimeType} _dayNightIndicatorBuilder()');
    if (state.is24Hformat) {
      return Container();
    }
    return Text(
      DateFormat('a').format(_dateTime),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.display3,
    );
  }
}
