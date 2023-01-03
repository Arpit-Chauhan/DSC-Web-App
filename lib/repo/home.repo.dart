import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_web/constants/config.dart';
import 'package:dsc_web/models/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {
  Future<UserModel> getData() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString('token') ?? "";
      if (token == "") {
        throw "403";
      } else {
        var body = jsonDecode(token);
        String email = body["email"];
        int i = email.indexOf('@');

        CollectionReference dataCollection = FirebaseFirestore.instance.collection(ConfigConsts.userdataColl);
        DocumentSnapshot snapshot = await dataCollection.doc(email).get();
        String testStatusStr;
        try {
          testStatusStr = snapshot.get(ConfigConsts.testStatusField);
        } catch (e) {
          testStatusStr = "";
        }
        if (testStatusStr == '') {
          // print("setting test status");
          await dataCollection.doc(email).set(
            {ConfigConsts.testStatusField: ConfigConsts.testWaiting},
            SetOptions(merge: true),
          );
        }

        UserModel model = new UserModel(email.substring(0, i), email, testStatusStr);
        return model;
      }
    } catch (e) {
      throw e;
    }
  }
}
