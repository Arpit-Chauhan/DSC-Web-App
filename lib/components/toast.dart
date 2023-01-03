import 'dart:async';
import 'package:dsc_web/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToastPreset {
  static successful({required String str, required BuildContext context}) async {
    await showCupertinoDialog(
      context: context,
      builder: (_) => CustomToast(
        color: ColorConsts.green,
        isError: false,
        msg: str,
      ),
    );
  }

  static err({required String str, required BuildContext context}) async {
    await showCupertinoDialog(
      context: context,
      builder: (_) => CustomToast(
        color: ColorConsts.red,
        isError: true,
        msg: str,
      ),
    );
  }
}

class CustomToast extends StatefulWidget {
  final Color color;
  final String msg;
  final bool isError;
  CustomToast({required this.color, required this.msg, required this.isError});

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = new Timer(new Duration(seconds: 2), () {
      timer.cancel();
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    try {
      timer.cancel();
    } catch (e) {
      print(e);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
          child: ui(),
        ),
        SizedBox(height: 60),
      ],
    );
  }

  Widget ui() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          decoration: BoxDecoration(
            color: widget.color,
          ),
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    widget.isError ? Icons.cancel : Icons.check_circle,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                TextSpan(
                  text: "  ${widget.msg}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
