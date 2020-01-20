import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../state/hour_format_state.dart';
import '../segment_display/two_digits_segment_display.dart';

class HoursWidget extends StatelessWidget {
  final DateTime _dateTime;

  const HoursWidget({
    Key key,
    @required DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HourFormatState>(
      builder: _hoursBuilder,
    );
  }

  Widget _hoursBuilder(BuildContext context, HourFormatState state, _) {
    final hoursFormat = state.is24Hformat ? DateFormat('H') : DateFormat('h');
    return TwoDigitsSegmentDisplay(digits: hoursFormat.format(_dateTime));
  }
}
