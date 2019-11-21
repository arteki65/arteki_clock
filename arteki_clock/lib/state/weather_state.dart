import 'package:arteki_clock/state/abstract_clock_settings_state.dart';
import 'package:flutter_clock_helper/model.dart';

class WeatherState extends AbstractClockSettingsState {
  String weather;

  WeatherState(ClockModel clockModel)
      : weather = clockModel.weatherString,
        super(clockModel);

  @override
  bool shouldNotifyListeners() => weather != clockModel.weatherString;

  @override
  void updateState(ClockModel clockModel) {
    weather = clockModel.weatherString;
  }
}
