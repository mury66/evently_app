import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/casheHelper/sharedPreferences.dart';
import 'package:evently_app/core/colors/darkColors.dart';
import 'package:evently_app/core/colors/lightColors.dart';
import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:evently_app/models/userModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/authProvider.dart';
import '../homeScreen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/signUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  void onError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
  void onSuccess(String message) {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: Colors.green,
      ),
    );
  }
  void _submitForm() async{
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      try {
        await authProvider.signUpWithEmail(user: UserModel(email: email), password: password,onError: onError,onSuccess: onSuccess);
      } catch (e) {
        print("Registration error: $e");
      }
    }

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Directionality(
          textDirection: ui.TextDirection.ltr,
          child: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text("sign_up".tr(),style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).primaryColor,
            )),
            leading: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20.r),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
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
                    controller: _nameController,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                      label: Text(
                        "name".tr(),
                        style: context.bodySmall.copyWith(
                          color: const Color(0xff7b7b7b),
                        ),
                      ),
                      prefixIcon: const ImageIcon(
                        AssetImage("assets/icons/profilefilled.png"),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'name is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: TextFormField(
                    controller: _emailController,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                      label: Text(
                        "email".tr(),
                        style: context.bodySmall.copyWith(
                          color: const Color(0xff7b7b7b),
                        ),
                      ),
                      prefixIcon: const ImageIcon(
                        AssetImage("assets/icons/email_ic.png"),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email is required';
                      }
                      final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                      if(!emailValid)
                        {
                          return "email isn't valid";
                        }
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: TextFormField(
                    controller: _phoneController,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                      label: Text(
                        "phone_number".tr(),
                        style: context.bodySmall.copyWith(
                          color: const Color(0xff7b7b7b),
                        ),
                      ),
                      prefixIcon: const ImageIcon(
                        AssetImage("assets/icons/phone.png"),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'phone number is required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                      prefixIcon: const ImageIcon(
                        AssetImage("assets/icons/password_ic.png"),
                      ),
                      label: Text(
                        "password".tr(),
                        style: context.bodySmall.copyWith(
                          color: const Color(0xff7b7b7b),
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
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscurePassword,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: const Color(0xff7b7b7b),
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                      prefixIcon: const ImageIcon(AssetImage("assets/icons/password_ic.png")),
                      label: Text(
                        "confirm_password".tr(),
                        style: context.bodySmall.copyWith(
                          color: const Color(0xff7b7b7b),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      "sign_up".tr(),
                      style: context.bodyMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                /// Already have an account?
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "already_have_account".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                        TextSpan(
                          text: "login".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                            color: LightColors().primary1,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                /// OR Divider
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
                    Text(
                      "Or",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: LightColors().primary1),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: SharedPreferencesHelper.getDarkMode()
                          ? DarkColors().backgroundColor
                          : LightColors().backgroundColor,
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
                            "signup_google".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: LightColors().primary1),
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