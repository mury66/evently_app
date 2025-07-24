import 'package:evently_app/core/styles/mainStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles implements MainStyles {
  @override
  TextStyle h1(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  @override
  TextStyle h2(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  @override
  TextStyle h3(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  @override
  TextStyle h4(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  TextStyle h5(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  TextStyle h6(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  TextStyle bodyXLargeBold(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  @override
  TextStyle bodyXLargeMedium(Color color) => GoogleFonts.inter(
    height: 1.3,
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  @override
  TextStyle bodyXLargeRegular(Color color) => GoogleFonts.inter(
    height: 1.3,
    color: color,
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );

  @override
  TextStyle bodyLargeBold(Color color) => GoogleFonts.inter(
    height: 1.45,
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  TextStyle bodyLargeMedium(Color color) => GoogleFonts.inter(
    height: 1.45,
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  @override
  TextStyle bodyLargeRegular(Color color) => GoogleFonts.inter(
    height: 1.45,
    color: color,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  @override
  TextStyle bodyMediumBold(Color color) => GoogleFonts.inter(
    height: 1.6,
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  @override
  TextStyle bodyMediumMedium(Color color) => GoogleFonts.inter(
    height: 1.6,
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  @override
  TextStyle bodyMediumRegular(Color color) => GoogleFonts.inter(
    height: 1.6,
    color: color,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  @override
  TextStyle bodySmallBold(Color color) => GoogleFonts.inter(
    height: 1.6,
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  @override
  TextStyle bodySmallMedium(Color color) => GoogleFonts.inter(
    height: 1.45,
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  @override
  TextStyle bodySmallRegular(Color color) => GoogleFonts.inter(
    height: 1.45,
    color: color,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );

  @override
  TextStyle bodyXSmallBold(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  @override
  TextStyle bodyXSmallMedium(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  @override
  TextStyle bodyXSmallRegular(Color color) => GoogleFonts.inter(
    color: color,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
}
