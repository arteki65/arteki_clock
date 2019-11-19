import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:provider/provider.dart';

import 'arteki_clock.dart';
import 'state/clock_settings_state.dart';
import 'state/hours_state.dart';
import 'state/minutes_state.dart';
import 'state/seconds_state.dart';

void main() {
  // A temporary measure until Platform supports web and TargetPlatform supports
  // macOS.
  if (!kIsWeb && Platform.isMacOS) {
    // TODO(gspencergoog): Update this when TargetPlatform includes macOS.
    // https://github.com/flutter/flutter/issues/31366
    // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override.
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(
    ClockCustomizer((model) {
      final secondsState = SecondsState();
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => ClockSettingsState(model)),
          ChangeNotifierProvider(builder: (_) => HoursState()),
          ChangeNotifierProvider(builder: (_) => MinutesState(secondsState)),
          ChangeNotifierProvider.value(value: secondsState),
        ],
        child: ArtekiClock(),
      );
    }),
  );
}
