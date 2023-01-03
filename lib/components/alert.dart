import 'dart:ui';
import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/constants/units.dart';
import 'package:dsc_web/models/user.model.dart';
import 'package:dsc_web/repo/quiz.repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AlertBox extends StatefulWidget {
  final String title, descriptions, text;
  final bool canGoBack;
  final UserModel model;
  const AlertBox(
      {required this.title,
      required this.descriptions,
      required this.text,
      required this.model,
      required this.canGoBack});

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  double padding = 20;
  double avatarRadius = 45;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future<bool>.value(false);
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: ScreenTypeLayout(
          mobile: contentBox(context),
          desktop: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: contentBox(context),
          ),
        ),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: padding, top: avatarRadius + padding, right: padding, bottom: padding),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorConsts.dark,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: kElevationToShadow[4],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: UnitConsts.fontHeader,
                  fontWeight: FontWeight.w600,
                  color: ColorConsts.white,
                ),
              ),
              SizedBox(height: 2),
              Text(
                widget.descriptions,
                style: TextStyle(
                  fontSize: UnitConsts.fontSmallHeader,
                  color: ColorConsts.white80,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.canGoBack
                      ? TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                              fontSize: UnitConsts.fontNormal,
                              color: ColorConsts.white80.withOpacity(0.6),
                            ),
                          ),
                        )
                      : SizedBox(),
                  TextButton(
                    onPressed: () => QuizRepo.submitSolutions(context, widget.model),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: UnitConsts.fontNormal,
                        color: ColorConsts.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
              child: Image.asset(
                "assets/image 2.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
