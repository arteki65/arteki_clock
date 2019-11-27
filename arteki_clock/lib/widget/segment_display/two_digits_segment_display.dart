import 'package:flutter/material.dart';

import 'seven_segment_display.dart';

const _goldenRatio = 1.62;

class TwoDigitsSegmentDisplay extends StatelessWidget {
  final String _digits;

  const TwoDigitsSegmentDisplay({
    Key key,
    @required String digits,
  })  : _digits = digits,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final chars =
        _digits.codeUnits.map((code) => String.fromCharCode(code)).toList();
    if (chars.length == 1) {
      chars.insert(0, null);
    }
    final size = DefaultTextStyle.of(context).style.fontSize * 0.7;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chars
          .map((char) => SevenSegmentDisplay(
                digit: char,
                height: size,
                width: size / _goldenRatio,
              ))
          .cast<Widget>()
          .toList()
            ..insert(1, SizedBox(width: 8)),
    );
  }
}
