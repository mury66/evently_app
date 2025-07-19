import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), ()
    {

    }
    );
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/evently_logo.png'
          ),
          Text(
            'Evently',

            style: GoogleFonts.jockeyOne(
              decoration: TextDecoration.none,
              fontSize: 36,
              color: Color(0xff5669FF),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
