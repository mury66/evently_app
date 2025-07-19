import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onBoarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isDarkMode = false;
  bool isArabic = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/evently_logo.png', height: 40),
            SizedBox(width: 8),
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/onboarding_img.png"),
              SizedBox(height: 28),
              Text(
                "Personalize Your Experience",
                style: context.bodyMedium.copyWith(color: context.primaryColor),
              ),
              SizedBox(height: 28),
              Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                style: context.bodySmall,
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Language",
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: context.primaryColor, width: 2),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: isArabic ? EdgeInsets.all(4) : null,
                          decoration: isArabic
                              ? BoxDecoration()
                              : BoxDecoration(
                                  color: context.primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: context.primaryColor,
                                    width: 4,
                                  ),
                                ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isArabic = false;
                              });
                            },
                            child: Image.asset(
                              "assets/icons/en_ic.png",
                              width: 21,
                              height: 21,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          margin: !isArabic ? EdgeInsets.all(4) : null,
                          decoration: !isArabic
                              ? BoxDecoration()
                              : BoxDecoration(
                                  color: context.primaryColor,

                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: context.primaryColor,
                                    width: 4,
                                  ),
                                ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isArabic = true;
                              });
                            },
                            child: Image.asset(
                              "assets/icons/ar_ic.png",
                              width: 21,
                              height: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Theme",
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: context.primaryColor, width: 2),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: isDarkMode ? EdgeInsets.all(4) : null,
                          decoration: isDarkMode
                              ? BoxDecoration()
                              : BoxDecoration(
                                  color: context.primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: context.primaryColor,
                                    width: 4,
                                  ),
                                ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isDarkMode = false;
                              });
                            },
                            child: Icon(
                              Icons.light_mode,
                              color: isDarkMode
                                  ? context.primaryColor
                                  : Colors.white,
                              size: 21,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          margin: !isDarkMode ? EdgeInsets.all(4) : null,
                          decoration: !isDarkMode
                              ? BoxDecoration()
                              : BoxDecoration(
                                  color: context.primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: context.primaryColor,
                                    width: 4,
                                  ),
                                ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isDarkMode = true;
                              });
                            },
                            child: Icon(
                              Icons.dark_mode,
                              color: !isDarkMode
                                  ? context.primaryColor
                                  : Colors.white,

                              size: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle continue button press
                  },
                  child: Text(
                    "Let's start",
                    style: context.bodyMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
