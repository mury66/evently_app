import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/themeProvider.dart';
import 'package:evently_app/register/logInScreen.dart';
import 'package:evently_app/screens/onBoarding/OnBoardingScreen.dart';
import 'package:evently_app/screens/onBoarding/introScreen.dart';
import 'package:evently_app/screens/splash/SplashScreen.dart';
import 'package:evently_app/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'casheHelper/sharedPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'),Locale('en')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      child: ChangeNotifierProvider(
          create: (BuildContext context) {
            return ThemeProvider();
          },
          child: MyApp()
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: SharedPreferencesHelper.getLanguage() == "ar" ? Locale('ar') : Locale('en'),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.themeMode,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
          IntroScreen.routeName: (context) => const IntroScreen(),
          LogInScreen.routeName: (context) => const LogInScreen(),
        },
        initialRoute: IntroScreen.routeName,
      ),
    );
  }
}
