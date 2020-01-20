import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/hours_state.dart';
import '../../state/minutes_state.dart';
import 'colon.dart';
import 'hours_widget.dart';
import 'minutes_widget.dart';

class TimeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.display4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RepaintBoundary(
            child: Consumer<HoursState>(builder: _hoursBuilder),
          ),
          const Colon(),
          RepaintBoundary(
            child: Consumer<MinutesState>(builder: _minutesBuilder),
          ),
        ],
      ),
    );
  }

  Widget _hoursBuilder(BuildContext context, HoursState state, _) {
    return HoursWidget(dateTime: state.dateTime);
  }

  Widget _minutesBuilder(BuildContext context, MinutesState state, _) {
    return MinutesWidget(dateTime: state.dateTime);
  }
}
