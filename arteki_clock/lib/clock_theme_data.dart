import 'package:flutter/material.dart';

const _fontFamily = 'Cute Font';

final _light = ClockThemeData(
  primaryColor: Colors.black.withOpacity(0.6),
  secondaryColor: Colors.grey.withOpacity(0.1),
  fontFamily: _fontFamily,
);

final _dark = ClockThemeData(
  primaryColor: Colors.grey[200].withOpacity(1),
  secondaryColor: Colors.grey.withOpacity(0.05),
  fontFamily: _fontFamily,
);

class ClockThemeData {
  final Color primaryColor;
  final Color secondaryColor;
  final String fontFamily;

  ClockThemeData({
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.fontFamily,
  });

  factory ClockThemeData.of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? _light : _dark;
  }
}
