import 'package:arteki_clock/util/debug_util.dart';
import 'package:arteki_clock/widget/segment_display/two_digits_segment_display.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MinutesWidget extends StatelessWidget {
  final DateTime _dateTime;

  const MinutesWidget({
    Key key,
    @required DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debug('$runtimeType - build()');
    final minutesText = DateFormat('mm').format(_dateTime);
    return TwoDigitsSegmentDisplay(digits: minutesText);
  }
}
