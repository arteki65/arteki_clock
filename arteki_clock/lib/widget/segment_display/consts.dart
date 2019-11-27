enum Digit { ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, NONE }

const Map<String, bool> _0digit = {
  'a': true,
  'b': true,
  'c': true,
  'd': true,
  'e': true,
  'f': true,
  'g': false,
};

const Map<String, bool> _1digit = {
  'a': false,
  'b': true,
  'c': true,
  'd': false,
  'e': false,
  'f': false,
  'g': false,
};

const Map<String, bool> _2digit = {
  'a': true,
  'b': true,
  'c': false,
  'd': true,
  'e': true,
  'f': false,
  'g': true,
};

const Map<String, bool> _3digit = {
  'a': true,
  'b': true,
  'c': true,
  'd': true,
  'e': false,
  'f': false,
  'g': true,
};

const Map<String, bool> _4digit = {
  'a': false,
  'b': true,
  'c': true,
  'd': false,
  'e': false,
  'f': true,
  'g': true,
};

const Map<String, bool> _5digit = {
  'a': true,
  'b': false,
  'c': true,
  'd': true,
  'e': false,
  'f': true,
  'g': true,
};

const Map<String, bool> _6digit = {
  'a': true,
  'b': false,
  'c': true,
  'd': true,
  'e': true,
  'f': true,
  'g': true,
};

const Map<String, bool> _7digit = {
  'a': true,
  'b': true,
  'c': true,
  'd': false,
  'e': false,
  'f': false,
  'g': false,
};

const Map<String, bool> _8digit = {
  'a': true,
  'b': true,
  'c': true,
  'd': true,
  'e': true,
  'f': true,
  'g': true,
};

const Map<String, bool> _9digit = {
  'a': true,
  'b': true,
  'c': true,
  'd': true,
  'e': false,
  'f': true,
  'g': true,
};

const Map<String, bool> _noneDigit = {
  'a': false,
  'b': false,
  'c': false,
  'd': false,
  'e': false,
  'f': false,
  'g': false,
};

Map<String, bool> digitToSegmentMap(String digit) {
  switch (mapStringToDigit(digit)) {
    case Digit.ZERO:
      return _0digit;
    case Digit.ONE:
      return _1digit;
    case Digit.TWO:
      return _2digit;
    case Digit.THREE:
      return _3digit;
    case Digit.FOUR:
      return _4digit;
    case Digit.FIVE:
      return _5digit;
    case Digit.SIX:
      return _6digit;
    case Digit.SEVEN:
      return _7digit;
    case Digit.EIGHT:
      return _8digit;
    case Digit.NINE:
      return _9digit;
    case Digit.NONE:
      return _noneDigit;
  }
  throw Exception('Segment map was not foung for $digit!');
}

Digit mapStringToDigit(String digit) {
  if (digit == '0') {
    return Digit.ZERO;
  }
  if (digit == '1') {
    return Digit.ONE;
  }
  if (digit == '2') {
    return Digit.TWO;
  }
  if (digit == '3') {
    return Digit.THREE;
  }
  if (digit == '4') {
    return Digit.FOUR;
  }
  if (digit == '5') {
    return Digit.FIVE;
  }
  if (digit == '6') {
    return Digit.SIX;
  }
  if (digit == '7') {
    return Digit.SEVEN;
  }
  if (digit == '8') {
    return Digit.EIGHT;
  }
  if (digit == '9') {
    return Digit.NINE;
  }
  if (digit == null || digit.isEmpty) {
    return Digit.NONE;
  }
  throw Exception('No Enum.DIGIT was found for $digit');
}
