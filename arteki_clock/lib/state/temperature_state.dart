import 'package:flutter_clock_helper/model.dart';

import 'abstract_state.dart';

class TemperatureState extends AbstractState<ClockModel> {
  String temperature;

  TemperatureState(ClockModel clockModel)
      : temperature = clockModel.temperatureString,
        super(clockModel);

  @override
  bool shouldNotifyListeners(ClockModel model) =>
      temperature != model.temperatureString;

  @override
  void updateState(ClockModel clockModel) {
    temperature = clockModel.temperatureString;
  }
}
