import 'package:flutter/cupertino.dart';

import '../util/debug_util.dart';
import 'time_state.dart';

class HoursState with ChangeNotifier {
  final TimeState _timeState;
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  HoursState(this._timeState) {
    debug('HoursState()');
    _timeState.addListener(_updateHours);
  }

  @override
  void dispose() {
    _timeState.removeListener(_updateHours);
    super.dispose();
  }

  void _updateHours() {
    if (_timeState.dateTime.hour != _dateTime.hour) {
      debug('notify hours! $_dateTime and ${_timeState.dateTime}');
      _dateTime = _timeState.dateTime;
      notifyListeners();
    }
  }
}
