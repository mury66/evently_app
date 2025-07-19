import 'package:evently_app/screens/onBoarding/OnBoardingScreen.dart';
import 'package:evently_app/screens/splash/SplashScreen.dart';
import 'package:evently_app/themes/AppTheme.dart';
import 'package:evently_app/themes/DarkTheme.dart';
import 'package:evently_app/themes/LightTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppTheme lightAppTheme = LightTheme();
  AppTheme darkAppTheme = DarkTheme();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightAppTheme.themeData,
      darkTheme: darkAppTheme.themeData,
      themeMode: ThemeMode.system,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
      },
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}