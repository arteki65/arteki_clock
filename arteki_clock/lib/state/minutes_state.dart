import '../util/debug_util.dart';
import 'abstract_state.dart';
import 'time_state.dart';

class MinutesState extends AbstractState<TimeState> {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  MinutesState(TimeState model) : super(model);

  void manualUpdate() {
    _dateTime = _dateTime.add(Duration(minutes: 1));
    notifyListeners();
  }

  @override
  bool shouldNotifyListeners(TimeState model) {
    if (model.dateTime.minute != _dateTime.minute) {
      debug(
          'notify minutes! _dateTime=$_dateTime and _timeState.dateTime=${model.dateTime}');
      return true;
    }
    return false;
  }

  @override
  void updateState(TimeState model) {
    _dateTime = model.dateTime;
  }
}
