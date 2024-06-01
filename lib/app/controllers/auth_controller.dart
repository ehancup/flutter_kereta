import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pas_xi_kereta/app/controllers/model.dart';

import 'package:pas_xi_kereta/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  RxBool isAdmin = false.obs;

  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  Stream streamAuthStatus = FirebaseAuth.instance.authStateChanges();

  login(String email, String pass) async {
    final db = FirebaseFirestore.instance;
    try {
      Get.defaultDialog(
          content: CircularProgressIndicator(), title: 'loading..');
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      // print(credential);

      print("================================================================");
      // print(credential.user!.uid);
      final admin = await db
          .collection('admin')
          .where('uid', isEqualTo: credential.user!.uid)
          .get()
          .then((value) {
        if (value.docs.isEmpty) {
          print('not admin');
          Get.offAllNamed(Routes.HOME);
          isAdmin.value = false;
        } else {
          isAdmin.value = true;
          for (var docSnapshot in value.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
          Get.offAllNamed(Routes.ADMIN);
        }
      });
      Get.showSnackbar(GetSnackBar(
        title: 'Success',
        message: 'welcome back, ${credential.user?.email}!',
        duration: Duration(seconds: 3),
      ));
      // print(admin);
      // Admin dm = adminFromJson(admin);
      // Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      // print(e.code);
      Get.back();
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        // print('Wrong password provided for that user.');
        Get.showSnackbar(GetSnackBar(
          // title: 'failed',
          message: 'Wrong password provided for that user.',
          duration: Duration(seconds: 3),
        ));
      }
    }
  }

  register(String email, String pass) async {
    try {
      Get.defaultDialog(
        content: CircularProgressIndicator(),
        title: 'loading..',
      );
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.back();
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.showSnackbar(GetSnackBar(
          // title: 'failed',
          message: 'The password provided is too weak.',
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.showSnackbar(GetSnackBar(
          title: 'failed',
          message: 'The account already exists for that email.',
          duration: Duration(seconds: 3),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithGoogle() async {
    // Trigger the authentication flow

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      try {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
        Get.offAllNamed(Routes.HOME);

        // Or use signInWithRedirect
        // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: e.toString(),
          duration: Duration(seconds: 3),
        ));
      }
    }
  }
}
