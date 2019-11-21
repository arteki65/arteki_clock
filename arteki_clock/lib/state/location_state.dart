import 'package:arteki_clock/state/abstract_clock_settings_state.dart';
import 'package:flutter_clock_helper/model.dart';

class LocationState extends AbstractClockSettingsState {
  String location;

  LocationState(ClockModel clockModel)
      : location = clockModel.location,
        super(clockModel);

  @override
  bool shouldNotifyListeners() => location != clockModel.location;

  @override
  void updateState(ClockModel clockModel) {
    location = clockModel.location;
  }
}
