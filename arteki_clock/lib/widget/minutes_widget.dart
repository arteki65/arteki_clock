import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../util/debug_util.dart';

class MinutesWidget extends StatelessWidget {
  final DateTime _dateTime;

  const MinutesWidget({
    Key key,
    DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    debug('MinutesWidget - build()');
    return Text(DateFormat('mm').format(_dateTime));
  }
}