import 'package:intl/intl.dart';

final isDebug = true;

void debug(String msg) {
  if (!isDebug) {
    return;
  }
  print('${DateFormat('HH:mm:ss').format(DateTime.now())} -> $msg');
}
