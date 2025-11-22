import 'package:flutter/material.dart';

/// Responsive utility to handle different screen sizes
/// Usage: Responsive.isMobile(context), Responsive.value(context, mobile: 1, tablet: 2, desktop: 3)
class Responsive {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  /// Returns appropriate value based on screen size
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  /// Returns responsive padding
  static double horizontalPadding(BuildContext context) {
    if (isLargeDesktop(context)) return 120;
    if (isDesktop(context)) return 80;
    if (isTablet(context)) return 40;
    return 24;
  }

  /// Returns responsive content width
  static double contentWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1400) return 1200;
    if (screenWidth > 1200) return 1000;
    return screenWidth - (horizontalPadding(context) * 2);
  }
}
