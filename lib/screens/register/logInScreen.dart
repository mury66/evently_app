import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/casheHelper/sharedPreferences.dart';
import 'package:evently_app/core/colors/darkColors.dart';
import 'package:evently_app/core/colors/lightColors.dart';
import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:evently_app/screens/register/signUpScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Form contains errors.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 1.sw,
                  child: Image.asset(
                    "assets/images/fullLogo.png",
                    width: 136.w,
                    height: 186.h,
                  ),
                ),
                SizedBox(height: 24.h),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: TextFormField(
                    controller: _emailController,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                      label: Text(
                        "email".tr(),
                        style: context.bodySmall.copyWith(
                          color: Color(0xff7b7b7b),
                        ),
                      ),
                      prefixIcon: ImageIcon(
                        AssetImage("assets/icons/email_ic.png"),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email is required';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "email is incorrect ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),

                /// Password Field
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: Theme.of(context).textTheme.bodySmall,

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),

                      prefixIcon: ImageIcon(
                        AssetImage("assets/icons/password_ic.png"),
                      ),
                      label: Text(
                        "password".tr(),
                        style: context.bodySmall.copyWith(
                          color: Color(0xff7b7b7b),
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.r,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password is required';
                      }
                      if (value.length < 8) {
                        return 'password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "forgot_password_text".tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: LightColors().primary1,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).primaryColor,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      "login".tr(),
                      style: context.bodyMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "don't_have_account".tr(),
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color:Theme.of(context).highlightColor,
                          ),
                        ),

                        TextSpan(
                          text: "create_account".tr(),
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                              color: LightColors().primary1,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                            ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, SignUpScreen.routeName);

                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: LightColors().primary1,
                        thickness: 1.w,
                        indent: 26.w,
                        endIndent: 16.w,
                      ),
                    ),
                    Text("Or",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: LightColors().primary1)
                    ),
                    Expanded(
                      child: Divider(
                        color: LightColors().primary1,
                        thickness: 1.w,
                        endIndent: 26.w,
                        indent: 16.w,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: SharedPreferencesHelper.getDarkMode() ?
                      DarkColors().backgroundColor : LightColors().backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        side: BorderSide(
                          color: LightColors().primary1,
                          width: 1.w,
                        ),
                      ),
                    ),
                    child: Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/google_ic.png",
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "login_google".tr(),
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: LightColors().primary1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
