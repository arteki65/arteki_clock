import 'dart:async';

import 'package:flutter/cupertino.dart';

class HoursState with ChangeNotifier {
  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  HoursState() {
    print('HoursState()');
    _updateHours();
  }

  void _updateHours() {
    _dateTime = DateTime.now();
    notifyListeners();

    Timer(
      Duration(hours: 1) -
          Duration(
            minutes: _dateTime.minute,
            seconds: _dateTime.second,
            milliseconds: _dateTime.millisecond,
          ),
      _updateHours,
    );
  }
}
