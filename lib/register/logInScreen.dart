import 'package:evently_app/extensions/BuildContextExt.dart';
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
              crossAxisAlignment: CrossAxisAlignment.end,
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
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff7b7b7b),
                    fontWeight: FontWeight.w500,
                  ),
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
                      "Email",
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
                SizedBox(height: 16.h),
                /// Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),

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
                      "Password",
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
                SizedBox(height: 16.h),
                TextButton(onPressed: (){}, child:Text("Forget Password?",style: context.bodySmall.copyWith(
                      color: context.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                ),)),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'Login',
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
      ),
    );
  }
}
