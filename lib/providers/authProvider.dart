import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/models/taskModel.dart';
import 'package:evently_app/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'fireStoreProvider.dart';

class AuthProvider extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;
  UserModel? _userModel;
  User? get user => _user;
  bool get isLoggedIn => _user != null;
  UserModel? get userModel => _userModel;

  AuthProvider() {
    _user = _auth.currentUser;
    if (_user != null) {
      initUser();
    }
    _auth.authStateChanges().listen((user) {
      _user = user;
      if (_user != null) {
        initUser();
      }
      else {
    _userModel = null;
    }
      notifyListeners();
    });
  }

  Future<void> initUser() async {
    _userModel = await FireStoreProvider.getUserById();
    notifyListeners();
  }

  Future<void> signUpWithEmail({required UserModel user,required String password,required Function onError,required Function onSuccess}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: user.email??"", password: password);
      userCredential.user!.sendEmailVerification();
      user.id = userCredential.user!.uid;
      onSuccess("signup_success".tr(),user);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
    }catch(e){
      print(e.toString());
      onError(e.toString());

    }
  }

  Future<void> signInWithEmail(String email,String password,{required Function onVerified,required Function onNotVerified,required Function onError}) async
  {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = userCredential.user;

      // if (_user != null) {
      //   await _user!.reload();
      //   if (_user!.emailVerified) {
      //     onVerified("login_success".tr());
      //   } else {
      //     onNotVerified();
      //   }
      // }

      onVerified("login_success".tr());
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }


  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
