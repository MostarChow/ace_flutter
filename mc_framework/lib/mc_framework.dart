import 'dart:async';

import 'package:flutter/services.dart';

class McFramework {
  static const MethodChannel _channel =
      const MethodChannel('mc_framework');

  Future<String> getName() async {
    var name = await _channel.invokeMethod("getName");
    return name;
  }

   goPage() {
    _channel.invokeMethod("goPage");
  }

}
