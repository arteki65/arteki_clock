import 'package:flutter/material.dart';

import '../util/debug_util.dart';
import 'minutes_widget.dart';

class AnimatedMinutesWidget extends StatefulWidget {
  // final MinutesState _minutesState;

  // const AnimatedMinutesWidget({
  //   Key key,
  //   @required MinutesState minutesState,
  // })  : _minutesState = minutesState,
  //       super(key: key);

  final DateTime _dateTime;

  const AnimatedMinutesWidget({
    Key key,
    @required DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  @override
  _AnimatedMinutesWidgetState createState() {
    debug('$runtimeType createState()');
    return _AnimatedMinutesWidgetState();
  }
}

class _AnimatedMinutesWidgetState extends State<AnimatedMinutesWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    debug('$runtimeType - initState()');

    _dateTime = widget._dateTime;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener(
        (status) => debug('$runtimeType - animationStatus=$status'));
    // _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    _animationController.forward();
    //widget._minutesState.addListener(_minutesChanged);
  }

  @override
  void didUpdateWidget(AnimatedMinutesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    debug('$runtimeType - didUpdateWidget($oldWidget)');
    if (_animationController.status == AnimationStatus.completed &&
        _dateTime != widget._dateTime) {
      _animationController.reverse().then((_) {
        setState(() {
          _dateTime = widget._dateTime;
        });
        _animationController.forward();
      });
    }

    // if (widget._minutesState != oldWidget._minutesState) {
    //   debug(
    //       '$runtimeType - didUpdateWidget($oldWidget) - _minutesState changed!');
    //   oldWidget._minutesState.removeListener(_minutesChanged);
    //   widget._minutesState.addListener(_minutesChanged);
    // }
  }

  @override
  void dispose() {
    debug('$runtimeType - dispose()');
    //widget._minutesState.removeListener(_minutesChanged);
    super.dispose();
  }

  // void _minutesChanged() {
  //   debug('$runtimeType - _minutesChanged()');
  //   setState(() {}); // minute ticks
  // }

  @override
  Widget build(BuildContext context) {
    debug('$runtimeType - build()');
    return ScaleTransition(
      child: MinutesWidget(dateTime: _dateTime),
      scale: _animationController,
    );
  }
}
