import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/clock_settings_state.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<ClockSettingsState>(
        builder: _weatherWidgetBuilder,
      );

  Widget _weatherWidgetBuilder(
          BuildContext context, ClockSettingsState state, _) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(state.model.temperatureString),
          SizedBox(width: 8),
          Text(state.model.weatherString),
        ],
      );
}
