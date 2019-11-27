import 'dart:math';

import 'package:arteki_clock/clock_theme_data.dart';
import 'package:flutter/material.dart';

import 'consts.dart';

class SevenSegmentDisplay extends StatelessWidget {
  final double _height;
  final double _width;
  final double _segmentWidth;
  final Map<String, bool> _segmentMap;
  final double _verticalSegmentHeight;

  SevenSegmentDisplay({
    Key key,
    @required double height,
    @required double width,
    String digit,
  })  : _height = height,
        _width = width,
        _segmentWidth = height / 10,
        _segmentMap = digitToSegmentMap(digit),
        _verticalSegmentHeight = height / 2 - height / 10 / 2,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = ClockThemeData.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _height,
        maxWidth: _width,
        minHeight: _height,
        minWidth: _width,
      ),
      child: Container(
        child: Stack(
          children: <Widget>[
            _aSegment(themeData),
            _bSegment(themeData),
            _cSegment(themeData),
            _dSegment(themeData),
            _eSegment(themeData),
            _fSegment(themeData),
            _gSegment(themeData),
          ],
        ),
      ),
    );
  }

  Widget _aSegment(ClockThemeData themeData) => Positioned(
        left: 0 + _segmentWidth,
        top: 0,
        width: _width - _segmentWidth * 2,
        height: _segmentWidth,
        child: _segment(_segmentMap['a'], themeData),
      );

  Widget _bSegment(ClockThemeData themeData) => Positioned(
        left: _width - _segmentWidth,
        top: 0 + _segmentWidth / 2,
        width: _segmentWidth,
        height: _verticalSegmentHeight,
        child: _segment(_segmentMap['b'], themeData),
      );
  Widget _cSegment(ClockThemeData themeData) => Positioned(
        left: _width - _segmentWidth,
        top: _height / 2,
        width: _segmentWidth,
        height: _verticalSegmentHeight,
        child: _segment(_segmentMap['c'], themeData),
      );

  Widget _dSegment(ClockThemeData themeData) => Positioned(
        left: 0 + _segmentWidth,
        top: _height - _segmentWidth,
        width: _width - 2 * _segmentWidth,
        height: _segmentWidth,
        child: _segment(_segmentMap['d'], themeData),
      );

  Widget _eSegment(ClockThemeData themeData) => Positioned(
        left: 0,
        top: _height / 2,
        width: _segmentWidth,
        height: _verticalSegmentHeight,
        child: _segment(_segmentMap['e'], themeData),
      );

  Widget _fSegment(ClockThemeData themeData) => Positioned(
        left: 0,
        top: 0 + _segmentWidth / 2,
        width: _segmentWidth,
        height: _verticalSegmentHeight,
        child: _segment(_segmentMap['f'], themeData),
      );

  Widget _gSegment(ClockThemeData themeData) => Positioned(
        left: 0 + _segmentWidth,
        top: (_height / 2) - _segmentWidth / 2,
        width: _width - 2 * _segmentWidth,
        height: _segmentWidth,
        child: _segment(_segmentMap['g'], themeData),
      );

  Widget _segment(bool enabled, ClockThemeData themeData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2 * pi),
        color: enabled ? themeData.primaryColor : themeData.secondaryColor,
      ),
    );
  }
}
