import 'package:flutter/material.dart';

import '../util/debug_util.dart';

class AnimatedDigits extends StatefulWidget {
  final DateTime _dateTime;
  final Widget Function(DateTime _dateTime) _builder;

  const AnimatedDigits({
    Key key,
    @required DateTime dateTime,
    @required Widget Function(DateTime _dateTime) builder,
  })  : _dateTime = dateTime,
        _builder = builder,
        super(key: key);

  @override
  _AnimatedDigitsState createState() {
    debug('$runtimeType createState()');
    return _AnimatedDigitsState();
  }
}

class _AnimatedDigitsState extends State<AnimatedDigits>
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
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(AnimatedDigits oldWidget) {
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
  }

  @override
  void dispose() {
    debug('$runtimeType - dispose()');
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debug('$runtimeType - build()');
    return ScaleTransition(
      child: widget._builder(_dateTime),
      scale: _animation,
    );
  }
}
