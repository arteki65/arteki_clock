import 'package:flutter/foundation.dart';

abstract class AbstractState<T extends ChangeNotifier> with ChangeNotifier {
  final T _model;

  AbstractState(this._model) {
    _model.addListener(_onModelChanged);
  }

  @override
  void dispose() {
    _model.removeListener(_onModelChanged);
    super.dispose();
  }

  void _onModelChanged() {
    if (shouldNotifyListeners(_model)) {
      updateState(_model);
      notifyListeners();
    }
  }

  bool shouldNotifyListeners(T model);

  void updateState(T model);
}
