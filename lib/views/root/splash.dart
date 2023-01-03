import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/repo/quiz.repo.dart';
import 'package:dsc_web/views/home/home.dart';
import 'package:dsc_web/views/login/login.dart';
import 'package:dsc_web/views/root/no_test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      startup();
    });
  }

  startup() async {
    if (await QuizRepo.isClosed()) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => NoTest()));
    } else {
      await Future.delayed(new Duration(milliseconds: 100));
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('token');
      if (token != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsts.white,
      body: Container(
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
