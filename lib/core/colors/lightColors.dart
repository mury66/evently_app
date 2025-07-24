import 'dart:ui';
import 'package:evently_app/core/colors/mainColors.dart';

class LightColors implements MainColors {

  @override
  Color get backgroundColor => const Color(0xFFF2FEFF);

  @override
  Color get primary1 => const Color(0xff5669FF); // Lightest

  @override
  Color get primary2 => const Color(0xff1C1C1C); // Lighter

  @override
  Color get primary3 => const Color(0xFF7A9BFF); // Light

  @override
  Color get primary4 => const Color(0xFF5669FF); // Normal

  @override
  Color get primary5 => const Color(0xFF3A4BFF); // Dark

  @override
  Color get primary6 => const Color(0xFF2A3BFF); // Darker

  @override
  Color get secondary => const Color(0xFF00BFA5); // Teal

  @override
  Color get warning => const Color(0xFFFFA000); // Amber

  @override
  Color get error => const Color(0xFFB00020);
}
