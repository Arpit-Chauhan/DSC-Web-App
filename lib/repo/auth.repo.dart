import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_web/components/loader.dart';
import 'package:dsc_web/components/toast.dart';
import 'package:dsc_web/constants/config.dart';
import 'package:dsc_web/views/home/home.dart';
import 'package:dsc_web/views/root/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  // static void login(context, email, domain) async {
  //   Loader.showLoaderDialog(context);
  //   CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.regUsersColl);
  //   QuerySnapshot documents = await dataCollection.get();
  //   QueryDocumentSnapshot doc = documents.docs[0];
  //   List mails = doc.get(ConfigConsts.regUsersField);
  //   mails = mails.map((email) => email.toLowerCase()).toList();

  //   if (mails.contains(email.toString().toLowerCase())) {
  //     var obj = {"email": email, "domain": domain};
  //     String token = jsonEncode(obj);
  //     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //     print(token);
  //     sharedPreferences.setString('token', token);
  //     CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.userdataColl);
  //     await dataCollection.doc(email).set(
  //       {ConfigConsts.emailField: email, ConfigConsts.domainField: domain},
  //       SetOptions(merge: true),
  //     );
  //     Navigator.pop(context);
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
  //   } else {
  //     Navigator.pop(context);
  //     ToastPreset.err(str: 'User not registered, contact admin', context: context);
  //   }
  // }

  static void gsignin(context) async {
    Loader.customLoaderDialog(context, 'Fetching Account');
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    } catch (e) {}

    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      final User? user = (await _firebaseAuth.signInWithCredential(credential)).user;

      if (user == null) {
        Navigator.pop(context);
        ToastPreset.err(context: context, str: 'Error User null');
        print("user is null");
        return;
      }

      CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.regUsersColl);
      QuerySnapshot documents = await dataCollection.get();
      QueryDocumentSnapshot doc = documents.docs[0];
      List mails = doc.get(ConfigConsts.regUsersField);
      mails = mails.map((email) => email.toLowerCase()).toList();

      if (mails.contains(user.email.toString().toLowerCase())) {
        var obj = {"email": user.email};
        String token = jsonEncode(obj);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        // print(token);
        sharedPreferences.setString('token', token);
        await FirebaseFirestore.instance.collection(ConfigConsts.userdataColl).doc(user.email).set(
          {ConfigConsts.emailField: user.email, 'lastloggedin': DateTime.now()},
          SetOptions(merge: true),
        );
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        Navigator.pop(context);
        ToastPreset.err(str: 'User not registered, contact admin', context: context);
        return;
      }
    } catch (e) {
      Navigator.pop(context);
      ToastPreset.err(context: context, str: 'Error $e');
      // print(e);
    }
  }

  static void logout(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.push(context, MaterialPageRoute(builder: (_) => SplashScreen()));
  }
}
