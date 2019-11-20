import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/clock_settings_state.dart';

class LocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<ClockSettingsState>(
        builder: _locationBuilder,
      );

  Widget _locationBuilder(BuildContext context, ClockSettingsState state, _) =>
      Text(
        state.model.location ?? '',
        textAlign: TextAlign.center,
      );
}
