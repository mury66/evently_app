import 'package:evently_app/screens/register/logInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/authProvider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      color: Colors.yellow,
    child: Center(
      child: ElevatedButton(onPressed: (){
        authProvider.signOut();
        Navigator.pushNamedAndRemoveUntil(context, LogInScreen.routeName, (route) => false);
      }, child:Text("log out")),
    ),
    );
  }
}
