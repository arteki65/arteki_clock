import 'package:flutter/foundation.dart';
import 'package:flutter_clock_helper/model.dart';

abstract class AbstractClockSettingsState with ChangeNotifier {
  @protected
  final ClockModel clockModel;

  AbstractClockSettingsState(this.clockModel) {
    clockModel.addListener(_onModelChanged);
  }

  @override
  void dispose() {
    clockModel.removeListener(_onModelChanged);
    super.dispose();
  }

  void _onModelChanged() {
    if (shouldNotifyListeners()) {
      updateState(clockModel);
      notifyListeners();
    }
  }

  bool shouldNotifyListeners();

  void updateState(ClockModel clockModel);
}
