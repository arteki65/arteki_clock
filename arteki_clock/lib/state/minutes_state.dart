import 'package:flutter/foundation.dart';

import 'seconds_state.dart';

class MinutesState with ChangeNotifier {
  final SecondsState _secondsState;
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  MinutesState(this._secondsState) {
    print('MinutesState()');
    _secondsState.addListener(_updateMinutes);
  }

  void _updateMinutes() {
    if (_secondsState.dateTime.minute != _dateTime.minute) {
      print('notify minutes! $_dateTime and ${_secondsState.dateTime}');
      _dateTime = _secondsState.dateTime;
      notifyListeners();
      return;
    }
  }
}
