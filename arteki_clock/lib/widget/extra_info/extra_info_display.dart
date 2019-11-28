import 'package:arteki_clock/clock_theme_data.dart';
import 'package:flutter/material.dart';

import 'loaction_widget.dart';
import 'weather_wdiget.dart';

class ExtraInfoDisplay extends StatelessWidget {
  final BoxConstraints _constraints;

  const ExtraInfoDisplay({
    Key key,
    @required BoxConstraints constraints,
  })  : _constraints = constraints,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = ClockThemeData.of(context);
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display1.copyWith(
            fontFamily: themeData.fontFamily,
            height: 0.9,
            color: themeData.primaryColor,
          ),
      child: Column(
        children: <Widget>[
          RepaintBoundary(
            child: WeatherWidget(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _constraints.maxHeight * 0.7,
            ),
            child: RepaintBoundary(
              child: LocationWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
