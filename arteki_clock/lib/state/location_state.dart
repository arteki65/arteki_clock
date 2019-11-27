import 'package:flutter_clock_helper/model.dart';

import 'abstract_state.dart';

class LocationState extends AbstractState<ClockModel> {
  String location;

  LocationState(ClockModel clockModel)
      : location = clockModel.location,
        super(clockModel);

  @override
  bool shouldNotifyListeners(ClockModel model) => location != model.location;

  @override
  void updateState(ClockModel clockModel) {
    location = clockModel.location;
  }
}
