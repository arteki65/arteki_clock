import 'dart:math';

import 'package:flutter/material.dart';

class EightSegmentDisplay extends StatelessWidget {
  final double _height;
  final double _width;

  const EightSegmentDisplay({
    Key key,
    double height,
    @required double width,
  })  : _height = height,
        _width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final segmentWidth = _height / 10;
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
            Positioned(
              left: 0 + segmentWidth,
              top: 0,
              width: _width - segmentWidth * 2,
              height: segmentWidth,
              child: _segment(false),
            ),
            Positioned(
              left: 0,
              top: 0,
              width: segmentWidth,
              height: _height / 2,
              child: _segment(false),
            ),
            Positioned(
              left: _width - segmentWidth,
              top: 0,
              width: segmentWidth,
              height: _height / 2,
              child: _segment(true),
            ),
            Positioned(
              left: 0,
              top: (_height / 2) + segmentWidth,
              width: _width,
              height: segmentWidth,
              child: _segment(false),
            ),
            Positioned(
              left: 0,
              top: 2 * segmentWidth + _height / 2,
              width: segmentWidth,
              height: _height / 2,
              child: _segment(false),
            ),
            Positioned(
              left: _width - segmentWidth,
              top: 2 * segmentWidth + _height / 2,
              width: segmentWidth,
              height: _height / 2,
              child: _segment(true),
            ),
            Positioned(
              left: 0,
              top: (_height) + 2 * segmentWidth,
              width: _width,
              height: segmentWidth,
              child: _segment(false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _segment(bool enabled) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2 * pi),
        color: enabled ? Colors.black87 : Colors.black38,
      ),
    );
  }
}
