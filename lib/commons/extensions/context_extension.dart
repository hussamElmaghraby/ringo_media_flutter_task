import 'package:flutter/material.dart';


extension AppContext on BuildContext {
  TextTheme get apptextTheme {
    return Theme.of(this).textTheme;
  }
  ColorScheme get appColorScheme {
    return Theme.of(this).colorScheme;
  }
}
