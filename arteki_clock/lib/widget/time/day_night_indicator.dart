import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../clock_theme_data.dart';
import '../../state/hour_format_state.dart';

class DayNightIndicator extends StatelessWidget {
  final DateTime _dateTime;

  const DayNightIndicator({
    Key key,
    @required DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HourFormatState>(
      builder: _dayNightIndicatorBuilder,
    );
  }

  Widget _dayNightIndicatorBuilder(
      BuildContext context, HourFormatState state, _) {
    if (state.is24Hformat) {
      return Container();
    }
    final themeData = ClockThemeData.of(context);
    return Text(
      DateFormat('a').format(_dateTime),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.display3.copyWith(
            fontFamily: themeData.fontFamily,
            color: themeData.primaryColor,
          ),
    );
  }
}
