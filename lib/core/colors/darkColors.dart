import 'dart:ui';
import 'package:evently_app/core/colors/mainColors.dart';

class DarkColors implements MainColors {
  @override
  Color get backgroundColor => const Color(0xff101127); // Very light blue

  @override
  Color get primary1 => const Color(0xff5669FF); // Very dark

  @override
  Color get primary2 => const Color(0xffF4EBDC); // Darker

  @override
  Color get primary3 => const Color(0xFF4D4D4D); // Even darker

  @override
  Color get primary4 => const Color(0xFF666666); // Mid-dark gray

  @override
  Color get primary5 => const Color(0xFF808080); // Neutral gray

  @override
  Color get primary6 => const Color(0xFF999999); // Light gray

  @override
  Color get secondary => const Color(0xFF00BFA5); // Teal

  @override
  Color get warning => const Color(0xFFFFA000); // Amber

  @override
  Color get error => const Color(0xFFB00020); // Dark red color for error
}
