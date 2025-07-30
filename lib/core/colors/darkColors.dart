import 'dart:ui';
import 'package:evently_app/core/colors/mainColors.dart';

class DarkColors implements MainColors {
  @override
  Color get backgroundColor => const Color(0xff101127);

  @override
  Color get textColor => const Color(0xffF4EBDC); // Very light blue

  @override
  Color get primary1 => const Color(0xff5669FF); // Very dark

  @override
  Color get primary2 => const Color(0xFFF2FEFF); // Darker

  @override
  Color get primary3 => const Color(0xFFF2FEFF); // Even darker

  @override
  Color get primary4 => const Color(0xFF666666); // Mid-dark gray

  @override
  Color get primary5 => const Color(0xFF808080); // Neutral gray

  @override
  Color get primary6 => const Color(0xFF999999); // Light gray

  @override
  Color get secondary => const Color(0xff101127); // Teal

  @override
  Color get warning => const Color(0xFFFFA000); // Amber

  @override
  Color get error => const Color(0xFFB00020); // Dark red color for error
}
