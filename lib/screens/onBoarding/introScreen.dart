import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/introScreen';
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/fullLogoHorizontal.png'),
      ),

    );
  }
}
