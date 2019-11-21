import 'package:arteki_clock/state/abstract_clock_settings_state.dart';
import 'package:flutter_clock_helper/model.dart';

class HourFormatState extends AbstractClockSettingsState {
  bool is24Hformat;

  HourFormatState(ClockModel clockModel)
      : is24Hformat = clockModel.is24HourFormat,
        super(clockModel);

  @override
  bool shouldNotifyListeners() => is24Hformat != clockModel.is24HourFormat;

  @override
  void updateState(ClockModel clockModel) {
    is24Hformat = clockModel.is24HourFormat;
  }
}
