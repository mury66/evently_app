import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/casheHelper/sharedPreferences.dart';
import 'package:evently_app/screens/register/logInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/themeProvider.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/introScreen';
  const IntroScreen({super.key});
  Widget buildImage(String path) {
    return Container(
      padding: EdgeInsets.all(20.r),
      alignment: Alignment.center,
      height: 360.h,
      width: double.infinity,
      child: Image.asset(
        "assets/images/$path.png",
        fit: BoxFit.cover,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    var themeProvider = Provider.of<ThemeProvider>(context);
        const buttonTextStyle = TextStyle(fontSize: 16,
      color: Color(0xffE2BE7F),
      fontWeight: FontWeight.bold,
      fontFamily: "janna",);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/fullLogoHorizontal.png'),
      ),
        body: IntroductionScreen(
            showNextButton: true,
            done: Image.asset(isArabic ? "assets/images/back_arr.png" :"assets/images/nxt_arr.png", width: 38.r,height: 38.r,),
            showBackButton: true,
            back: Image.asset( isArabic ? "assets/images/nxt_arr.png":"assets/images/back_arr.png", width: 38.r,height: 38.r,),
            next: Directionality(
              textDirection:  ui.TextDirection.ltr,
                child: Image.asset( isArabic ? "assets/images/back_arr.png":"assets/images/nxt_arr.png", width: 38.r,height: 38.r,)),

            onDone: () {
              SharedPreferencesHelper.setOnBoardingSeen(true);
              Navigator.pushReplacementNamed(context, LogInScreen.routeName);
            },
            dotsDecorator: DotsDecorator(
              activeSizes: [Size(20.r,8.r),Size(20.r,8.r),Size(20.r,8.r)],
              size: Size(8.r,8.r),
              color: themeProvider.isDarkMode ? const Color(0xffF4EBDC) : const Color(0xff1C1C1C),
              activeColor: Color(0xff5669FF),
              activeSize: const Size(22.0, 10.0),
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            pages: [
              PageViewModel(
                decoration: PageDecoration(
                  imageFlex: 4,
                  bodyFlex: 3,

                ),
                titleWidget: Align(
                  alignment: SharedPreferencesHelper.getLanguage() == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    "introduction_title1".tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                bodyWidget: Align(
                  alignment: SharedPreferencesHelper.getLanguage() == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                      "introduction_body1".tr()),),
                image:buildImage("intro_img1"),
              ),
              PageViewModel(
                decoration: PageDecoration(
                  imageFlex: 4,
                  bodyFlex: 3,

                ),
                titleWidget: Align(
                  alignment: SharedPreferencesHelper.getLanguage() == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    "introduction_title2".tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                bodyWidget: Align(
                  alignment: SharedPreferencesHelper.getLanguage() == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                      "introduction_body2".tr()),),
                image:buildImage("intro_img2"),
              ),
              PageViewModel(
                decoration: PageDecoration(
                  imageFlex: 4,
                  bodyFlex: 3,

                ),
                titleWidget: Align(
                  alignment: SharedPreferencesHelper.getLanguage() == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                    "introduction_title3".tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                bodyWidget: Align(
                  alignment: SharedPreferencesHelper.getLanguage() == "ar" ? Alignment.centerRight : Alignment.centerLeft,
                  child: Text(
                      "introduction_body3".tr()),),
                image:buildImage("intro_img3"),
              ),


            ]
        )

    );
  }
}
