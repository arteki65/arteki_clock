import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/temperature_state.dart';
import '../../state/weather_state.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<TemperatureState>(
            builder: _temperatureBuilder,
          ),
          SizedBox(width: 8),
          Consumer<WeatherState>(
            builder: _weatherBuilder,
          ),
        ],
      );

  Widget _temperatureBuilder(BuildContext context, TemperatureState state, _) =>
      Text(state.temperature);

  Widget _weatherBuilder(BuildContext context, WeatherState state, _) =>
      Text(state.weather);
}
