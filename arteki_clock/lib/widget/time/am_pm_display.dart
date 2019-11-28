import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/hours_state.dart';
import '../../util/debug_util.dart';
import 'day_night_indicator.dart';

class AmPmDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Consumer<HoursState>(
        builder: _dayNightIndicatorBuilder,
      ),
    );
  }

  Widget _dayNightIndicatorBuilder(BuildContext context, HoursState state, _) {
    debug('$runtimeType - _dayNightIndicatorBuilder()');
    return DayNightIndicator(dateTime: state.dateTime);
  }
}
