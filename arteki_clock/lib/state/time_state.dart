import 'dart:async';

import 'package:flutter/foundation.dart';


class TimeState with ChangeNotifier {
  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  TimeState() {
    _updateTime();
  }

  void _updateTime() {
    _dateTime = DateTime.now();
    notifyListeners();

    // Update once per second, but make sure to do it at the beginning of each
    // new second, so that the clock is accurate.
    Timer(
      Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      _updateTime,
    );
  }
}
