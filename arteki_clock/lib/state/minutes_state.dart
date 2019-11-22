import 'package:flutter/foundation.dart';

import '../util/debug_util.dart';
import 'time_state.dart';

class MinutesState with ChangeNotifier {
  final TimeState _timeState;
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  MinutesState(this._timeState) {
    debug('MinutesState()');
    _timeState.addListener(_updateMinutes);
  }

  @override
  void dispose() {
    debug('MinutesState - dispose()');
    _timeState.removeListener(_updateMinutes);
    super.dispose();
  }

  void _updateMinutes() {
    if (_timeState.dateTime.minute != _dateTime.minute) {
      debug(
          'notify minutes! _dateTime=$_dateTime and _timeState.dateTime=${_timeState.dateTime}');
      _dateTime = _timeState.dateTime;
      notifyListeners();
    }
  }

  void manualUpdate() {
    _dateTime = _dateTime.add(Duration(minutes: 1));
    notifyListeners();
  }
}
