import 'package:flutter_clock_helper/model.dart';

import 'abstract_state.dart';

class WeatherState extends AbstractState<ClockModel> {
  String weather;

  WeatherState(ClockModel clockModel)
      : weather = clockModel.weatherString,
        super(clockModel);

  @override
  bool shouldNotifyListeners(ClockModel clockModel) =>
      weather != clockModel.weatherString;

  @override
  void updateState(ClockModel clockModel) {
    weather = clockModel.weatherString;
  }
}
