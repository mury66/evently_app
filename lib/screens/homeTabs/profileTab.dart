import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:evently_app/screens/register/logInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/authProvider.dart';
import '../../providers/fireStoreProvider.dart';
import '../../models/userModel.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _nameController = TextEditingController(
      text:
          authProvider.userModel?.name ?? authProvider.user?.displayName ?? '',
    );
    _phoneController = TextEditingController(
      text:
          authProvider.userModel?.phone ?? authProvider.user?.phoneNumber ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    final userModel = authProvider.userModel;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8.h),
              Center(
                child: CircleAvatar(
                  radius: 44.r,
                  backgroundColor: Theme.of(context).splashColor,
                  child: Icon(Icons.person, size: 44.r, color: Colors.white),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Text(
                  userModel?.name ?? user?.displayName ?? 'Guest',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              if (userModel?.email != null || user?.email != null)
                Center(
                  child: Text(
                    userModel?.email ?? user?.email ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),

              SizedBox(height: 24.h),
              if (authProvider.isLoggedIn)
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        decoration: InputDecoration(
                          labelText: 'name'.tr(),
                          prefixIcon: Icon(Icons.badge),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        decoration: InputDecoration(
                          labelText: 'phone'.tr(),
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'phone is required';
                          }
                          if (!RegExp(
                            r'^\+?[0-9]{7,15}$',
                          ).hasMatch(value.trim())) {
                            return 'invalid phone number';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

              SizedBox(height: 24.h),

              if (authProvider.isLoggedIn)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saving
                        ? null
                        : () async {
                            if (!_formKey.currentState!.validate()) return;
                            setState(() => _saving = true);
                            try {
                              final updated = UserModel(
                                id: user?.uid,
                                name: _nameController.text.trim(),
                                email: userModel?.email ?? user?.email,
                                phone: _phoneController.text.trim(),
                              );
                              await FireStoreProvider().updateUser(
                                updated,
                                context,
                              );
                              await authProvider.initUser();
                            } finally {
                              if (mounted) setState(() => _saving = false);
                            }
                          },
                    child: _saving
                        ? SizedBox(
                            height: 20.r,
                            width: 20.r,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            'save'.tr(),
                            style: context.bodyMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LogInScreen.routeName,
                      );
                    },
                    child: Text(
                      'login'.tr(),
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
