

import 'package:flutter/foundation.dart';

//TODO: 1-kDebug //kRelease //kisWeb

class LogManager {
  LogManager._();

  

  static void logToConsole(Object? value, [String? title = "log :"]) {
    if (kDebugMode) {
      debugPrint("$title:\t ${value.toString()}");
    }
  }
}
