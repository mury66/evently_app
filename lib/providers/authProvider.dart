import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;
  User? get user => _user;
  bool get isLoggedIn => _user != null;

  AuthProvider() {
    _user = _auth.currentUser;
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signUpWithEmail({required UserModel user,required String password,required Function onError,required Function onSuccess}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: user.email??"", password: password);
      userCredential.user!.sendEmailVerification();
      _user = userCredential.user;
      onSuccess("signup_success".tr());
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

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      print('Email sign-in error: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      _user = userCredential.user;
      notifyListeners(); // ✅ ضروري
    } catch (e) {
      print('Google sign-in error: $e');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
