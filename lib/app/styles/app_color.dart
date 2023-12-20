import 'package:flutter/widgets.dart';

class AppColor {
  static LinearGradient primaryGradient = const LinearGradient(
      colors: [primary, Color(0xFF0F50C6)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const Color primary = Color(0xFF266EF1);
  static const Color primarySoft = Color(0xFF548DF3);
  static const Color primaryExtraSoft = Color(0xFFEFF3FC);
  static const Color secondary = Color(0xFF1B1F24);
  static const Color secondarySoft = Color(0xFF9D9D9D);
  static const Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static const Color error = Color(0xFFD00E0E);
  static const Color success = Color(0xFF16AE26);
  static const Color warning = Color(0xFFEB8600);
}
