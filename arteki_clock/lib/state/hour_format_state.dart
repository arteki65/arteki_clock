import 'package:flutter_clock_helper/model.dart';

import 'abstract_state.dart';

class HourFormatState extends AbstractState<ClockModel> {
  bool is24Hformat;

  HourFormatState(ClockModel clockModel)
      : is24Hformat = clockModel.is24HourFormat,
        super(clockModel);

  @override
  bool shouldNotifyListeners(ClockModel model) =>
      is24Hformat != model.is24HourFormat;

  @override
  void updateState(ClockModel clockModel) {
    is24Hformat = clockModel.is24HourFormat;
  }
}
