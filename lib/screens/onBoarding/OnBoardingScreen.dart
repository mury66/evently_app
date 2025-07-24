import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../casheHelper/sharedPreferences.dart';
import '../../providers/themeProvider.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onBoarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/fullLogoHorizontal.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20.r),
                width: double.infinity,
                height: 361.h,

                child: Image.asset(
                  SharedPreferencesHelper.getDarkMode()
                      ? "assets/images/onboarding_img_dark.png"
                      : "assets/images/onboarding_img.png",
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                "onboarding_title1".tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 28.h),
              Text("onboarding_body1".tr(), style: context.bodyLarge),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "language".tr(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: context.primaryColor,
                          width: 2.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: SharedPreferencesHelper.getLanguage() == "ar" ? EdgeInsets.all(4.r)
                                : null,
                            decoration: SharedPreferencesHelper.getLanguage() == "ar" ? BoxDecoration()
                                : BoxDecoration(
                                    color: context.primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: context.primaryColor,
                                      width: 4.r,
                                    ),
                                  ),
                            child: InkWell(
                              onTap: () {
                                context.setLocale(Locale("en"));
                                SharedPreferencesHelper.setLanguage("en");
                              },
                              child: Image.asset(
                                "assets/icons/en_ic.png",
                                width: 21.w,
                                height: 21.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            margin: SharedPreferencesHelper.getLanguage() != "ar" ? EdgeInsets.all(4)
                                : null,
                            decoration: SharedPreferencesHelper.getLanguage() != "ar" ? BoxDecoration()
                                : BoxDecoration(
                                    color: context.primaryColor,

                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: context.primaryColor,
                                      width: 4.w,
                                    ),
                                  ),
                            child: InkWell(
                              onTap: () {
                                context.setLocale(Locale("ar"));
                                SharedPreferencesHelper.setLanguage("ar");
                              },
                              child: Image.asset(
                                "assets/icons/ar_ic.png",
                                width: 21.w,
                                height: 21.h,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    "theme".tr(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.r,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: SharedPreferencesHelper.getDarkMode() ? EdgeInsets.all(4.r) : null,
                          decoration: SharedPreferencesHelper.getDarkMode() ? BoxDecoration()
                              : BoxDecoration(
                                  color: context.primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: context.primaryColor,
                                    width: 4.r,
                                  ),
                                ),
                          child: InkWell(
                            onTap: () {
                              themeProvider.setThemeMode(ThemeMode.light);
                              SharedPreferencesHelper.setDarkMode(false);
                            },
                            child: Icon(
                              Icons.light_mode,
                              color: SharedPreferencesHelper.getDarkMode()
                                  ? context.primaryColor
                                  : context.primaryColorLight,
                              size: 21.r,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          margin: !SharedPreferencesHelper.getDarkMode() ? EdgeInsets.all(4) : null,
                          decoration: !SharedPreferencesHelper.getDarkMode() ? BoxDecoration()
                              : BoxDecoration(
                                  color: context.primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: context.primaryColor,
                                    width: 4.r,
                                  ),
                                ),
                          child: InkWell(
                            onTap: () {
                              themeProvider.setThemeMode(ThemeMode.dark);
                              SharedPreferencesHelper.setDarkMode(true);
                            },
                            child: Icon(
                              Icons.dark_mode,
                              color: !SharedPreferencesHelper.getDarkMode()
                                  ? context.primaryColor
                                  : context.primaryColorLight,

                              size: 21.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              ElevatedButton(
                onPressed: () {
                  SharedPreferencesHelper.setOnBoardingSeen(true);
                  Navigator.pushReplacementNamed(context, '/login'); // Adjust the route as needed
                },
                child: Text(
                  "onboarding_button1".tr(),
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
