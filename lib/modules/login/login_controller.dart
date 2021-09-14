import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:payapp/shared/auth/auth_controller.dart';
import 'package:payapp/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final user = UserModel(
          name: googleSignInAccount.displayName!,
          photoURL: googleSignInAccount.photoUrl!);

      authController.setUser(context, user);
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (error) {
        authController.setUser(context, null);
        print(error);
      }
    }
  }
}
