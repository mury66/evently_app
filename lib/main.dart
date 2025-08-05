import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/authProvider.dart';
import 'package:evently_app/providers/categoriesProvider.dart';
import 'package:evently_app/providers/fitrstoreProvider.dart';
import 'package:evently_app/providers/tabsProvider.dart';
import 'package:evently_app/providers/themeProvider.dart';
import 'package:evently_app/screens/createEvent/createEventScreen.dart';
import 'package:evently_app/screens/homeScreen.dart';
import 'package:evently_app/screens/onBoarding/OnBoardingScreen.dart';
import 'package:evently_app/screens/onBoarding/introScreen.dart';
import 'package:evently_app/screens/register/logInScreen.dart';
import 'package:evently_app/screens/register/signUpScreen.dart';
import 'package:evently_app/screens/splash/SplashScreen.dart';
import 'package:evently_app/themes/AppTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'casheHelper/sharedPreferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'),Locale('en')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      saveLocale: true,
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider(),
            ),
            ChangeNotifierProvider<TabsProvider>(
              create: (context) => TabsProvider(),
            ),
            ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider(),
            ),
            ChangeNotifierProvider<CategoriesProvider>(
              create: (_) => CategoriesProvider(),
            ),
            ChangeNotifierProvider<FireStoreProvider>(
              create: (_) => FireStoreProvider(),
            ),
          ],
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
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(isDarkMode: false, context: context),
        darkTheme: AppTheme.getTheme(isDarkMode: true, context: context),
        themeMode: themeProvider.themeMode,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
          IntroScreen.routeName: (context) => const IntroScreen(),
          LogInScreen.routeName: (context) => const LogInScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          CreateEvent.routeName: (context) => CreateEvent(),
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
