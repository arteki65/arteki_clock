import '../util/debug_util.dart';
import 'abstract_state.dart';
import 'time_state.dart';

class HoursState extends AbstractState<TimeState> {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  HoursState(TimeState model) : super(model);

  void manualUpdate() {
    _dateTime = _dateTime.add(Duration(hours: 1));
    notifyListeners();
  }

  @override
  bool shouldNotifyListeners(TimeState model) {
    if (model.dateTime.hour != _dateTime.hour) {
      debug('notify hours! $_dateTime and ${model.dateTime}');
      return true;
    }
    return false;
  }

  @override
  void updateState(TimeState model) {
    _dateTime = model.dateTime;
  }
}
