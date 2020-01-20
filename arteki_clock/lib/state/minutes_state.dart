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
  bool shouldNotifyListeners(TimeState model) =>
      model.dateTime.minute != _dateTime.minute;

  @override
  void updateState(TimeState model) {
    _dateTime = model.dateTime;
  }
}
