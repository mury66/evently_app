import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextStyle get bodyLarge {
    return Theme.of(this).textTheme.bodyLarge ?? TextStyle();
  }
  TextStyle get bodyMedium {
    return Theme.of(this).textTheme.bodyMedium ?? TextStyle();
  }
  TextStyle get bodySmall {
    return Theme.of(this).textTheme.bodySmall ?? TextStyle();
  }
  Color get primaryColor {
    return Theme.of(this).primaryColor;
  }
  Color get primaryColorLight {
    return Theme.of(this).primaryColorLight;
  }
}