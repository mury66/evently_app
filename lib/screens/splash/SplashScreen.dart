import 'package:evently_app/screens/homeScreen.dart';
import 'package:evently_app/screens/register/logInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../casheHelper/sharedPreferences.dart';
import '../../providers/authProvider.dart';
import '../onBoarding/OnBoardingScreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    Future.delayed(Duration(milliseconds: 750), () {
      SharedPreferencesHelper.getOnBoardingSeen() ?
      userProvider.isLoggedIn ? Navigator.pushReplacementNamed(context, HomeScreen.routeName)
          :Navigator.pushReplacementNamed(context, LogInScreen.routeName)

          : Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
            width: 136.w,
            height: 186.h,
            child: Image.asset("assets/images/fullLogo.png")),
      ),
    );
  }
}
