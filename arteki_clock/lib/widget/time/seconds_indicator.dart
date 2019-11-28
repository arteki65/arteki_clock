import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/time_state.dart';
import 'seconds_circle.dart';

class SecondsIndicator extends StatelessWidget {
  final BoxConstraints _constraints;

  const SecondsIndicator({
    Key key,
    @required BoxConstraints constraints,
  })  : this._constraints = constraints,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Consumer<TimeState>(
        builder: (context, state, _) =>
            _secondsIndicatorBuilder(state, _constraints),
      ),
    );
  }

  Widget _secondsIndicatorBuilder(TimeState state, BoxConstraints constraints) {
    return SecondsCircle(
      dateTime: state.dateTime,
      radius: constraints.maxHeight * 0.95,
    );
  }
}
