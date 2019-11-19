import 'dart:async';

import 'package:flutter/cupertino.dart';

class SecondsState with ChangeNotifier {
  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  SecondsState() {
    print('SecondsState()');
    _updateSeconds();
  }

  void _updateSeconds() {
    _dateTime = DateTime.now();
    notifyListeners();
    // Update once per minute. If you want to update every second, use the
    // following code.
    // Timer(
    //   Duration(minutes: 1) -
    //       Duration(seconds: _dateTime.second) -
    //       Duration(milliseconds: _dateTime.millisecond),
    //   _updateTime,
    // );

    // Update once per second, but make sure to do it at the beginning of each
    // new second, so that the clock is accurate.
    Timer(
      Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      _updateSeconds,
    );
  }
}
