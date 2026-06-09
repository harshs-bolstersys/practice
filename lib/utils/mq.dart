import 'package:flutter/widgets.dart';

class MQ {
  static late MediaQueryData _mediaQuery;
  static late double width;
  static late double height;
  static late double top;
  static late double bottom;

  static void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    width = _mediaQuery.size.width;
    height = _mediaQuery.size.height;
    top = _mediaQuery.padding.top;
    bottom = _mediaQuery.padding.bottom;
  }

  // Percentage width helper
  static double w(double percent) => width * percent / 100;

  // Percentage height helper
  static double h(double percent) => height * percent / 100;
}
