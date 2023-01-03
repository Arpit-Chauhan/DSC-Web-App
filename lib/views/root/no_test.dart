import 'package:dsc_web/constants/colors.dart';
import 'package:flutter/material.dart';

class NoTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConsts.white,
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Text('No Active Test\nPlease wait for admins to start the Test'),
          ),
        ),
      ),
    );
  }
}
