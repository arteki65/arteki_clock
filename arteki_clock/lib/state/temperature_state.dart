import 'package:flutter_clock_helper/model.dart';

import 'abstract_clock_settings_state.dart';

class TemperatureState extends AbstractClockSettingsState {
  String temperature;

  TemperatureState(ClockModel clockModel)
      : temperature = clockModel.temperatureString,
        super(clockModel);

  @override
  bool shouldNotifyListeners() => temperature != clockModel.temperatureString;

  @override
  void updateState(ClockModel clockModel) {
    temperature = clockModel.temperatureString;
  }
}
