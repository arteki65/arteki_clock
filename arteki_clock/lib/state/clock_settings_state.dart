import 'package:flutter/foundation.dart';
import 'package:flutter_clock_helper/model.dart';

class ClockSettingsState with ChangeNotifier {
  final ClockModel model;

  ClockSettingsState(this.model) {
    model.addListener(_onModelChanged);
  }

  @override
  void dispose() {
    model.removeListener(_onModelChanged);
    super.dispose();
  }

  void _onModelChanged() {
    notifyListeners();
  }
}
