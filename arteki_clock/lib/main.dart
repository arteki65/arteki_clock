import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:provider/provider.dart';

import 'arteki_clock.dart';
import 'state/hour_format_state.dart';
import 'state/hours_state.dart';
import 'state/location_state.dart';
import 'state/minutes_state.dart';
import 'state/temperature_state.dart';
import 'state/time_state.dart';
import 'state/weather_state.dart';

void main() {
  // A temporary measure until Platform supports web and TargetPlatform supports
  // macOS.
  if (!kIsWeb && Platform.isMacOS) {
    // TODO(gspencergoog): Update this when TargetPlatform includes macOS.
    // https://github.com/flutter/flutter/issues/31366
    // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override.
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  final timeState = TimeState();

  runApp(
    ClockCustomizer((model) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => HourFormatState(model)),
          ChangeNotifierProvider(builder: (_) => LocationState(model)),
          ChangeNotifierProvider(builder: (_) => TemperatureState(model)),
          ChangeNotifierProvider(builder: (_) => WeatherState(model)),
          ChangeNotifierProvider(builder: (_) => HoursState(timeState)),
          ChangeNotifierProvider(builder: (_) => MinutesState(timeState)),
          ChangeNotifierProvider.value(value: timeState),
        ],
        child: ArtekiClock(),
      );
    }),
  );
}
