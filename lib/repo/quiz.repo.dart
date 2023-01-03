import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_web/components/alert.dart';
import 'package:dsc_web/components/loader.dart';
import 'package:dsc_web/constants/config.dart';
import 'package:dsc_web/constants/questions.dart';
import 'package:dsc_web/models/question.model.dart';
import 'package:dsc_web/models/user.model.dart';
import 'package:dsc_web/views/home/end_test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizRepo {
  static Future<bool> isClosed() async {
    CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.testTimeColl);
    QuerySnapshot documents = await dataCollection.get();
    QueryDocumentSnapshot doc = documents.docs[0];
    bool res = doc.get('isClosed');
    return res;
  }

  static void testStarted(mail) async {
    CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.userdataColl);
    await dataCollection.doc(mail).set(
      {ConfigConsts.testStatusField: ConfigConsts.testStarted},
      SetOptions(merge: true),
    );
  }

  static void submitSolutions(context, UserModel model) async {
    Loader.customLoaderDialog(
      context,
      'Please wait while your test is being submitted. Do not navigate from this page, else you might lose all your data.',
    );
    int score = 0;
    List jsonData = [];
    for (QuestionModel model in QuestionBank.list) {
      jsonData.add(model.toJson());
      if (model.userMarkedOption == model.correctOption) score++;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(ConfigConsts.prefsKeyApti);
    // print(jsonData);
    // print(score);

    CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.userdataColl);
    await dataCollection.doc(model.mail).set(
      {
        ConfigConsts.quizDataField: jsonData,
        ConfigConsts.scoreField: score,
        ConfigConsts.testStatusField: ConfigConsts.testEnded,
      },
      SetOptions(merge: true),
    );

    Navigator.pop(context);
    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
    Navigator.push(context, MaterialPageRoute(builder: (_) => EndTestPage()));
  }

  static void updatePref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List jsonData = [];
    for (QuestionModel model in QuestionBank.list) {
      jsonData.add(model.toSecureJson());
    }
    String coded = jsonEncode(jsonData);
    // print("saving code : $coded");
    sharedPreferences.setString(ConfigConsts.prefsKeyApti, coded);
  }

  static Future<bool> restoreData(context) async {
    // get json - decode - index wise set answer
    Loader.showLoaderDialog(context);
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? data = sharedPreferences.getString(ConfigConsts.prefsKeyApti);
      List jsonlist = jsonDecode(data ?? "{}");
      for (int i = 0; i < jsonlist.length; i++) {
        QuestionBank.list[i].userMarkedOption = jsonlist[i]['userMarkedOption'];
      }
    } catch (e) {
      // print("restoring error : $e");
    }
    Navigator.pop(context);
    return true;
  }

  static void endTest(context, UserModel model) {
    // print("user ended test");
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertBox(
          title: "End Test?",
          descriptions: "Are you sure you want to end the test now?",
          text: "Yes",
          model: model,
          canGoBack: true,
        );
      },
    );
  }

  static void timeUp(context, UserModel model) {
    // print("time is up");
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertBox(
          title: "Time\'s up",
          descriptions:
              "Time is up for the test and please Proceed by clicking on the below button and don\'t navigate now. Your test wont be submitted if you dont proceed.",
          text: "Proceed",
          model: model,
          canGoBack: false,
        );
      },
    );
  }
}
