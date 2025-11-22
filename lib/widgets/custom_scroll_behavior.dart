import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Custom scroll behavior for smooth scrolling on web
/// Enables mouse wheel and touch scrolling
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}
