import 'package:dsc_web/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ElevatedButtonCustom {
  static Widget bigButton({required text, required func, required color}) {
    Widget ui = ElevatedButton(
      onPressed: func,
      child: Text(
        text,
        style: TextStyle(
          color: ColorConsts.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        visualDensity: VisualDensity.comfortable,
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 12)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );

    return ScreenTypeLayout(
      mobile: Container(width: double.infinity, child: ui),
      desktop: Container(width: 200, child: ui),
    );
  }

  static Widget smallButton({required text, required func, required color}) {
    return ElevatedButton(
      onPressed: func,
      child: Text(
        text,
        style: TextStyle(
          color: ColorConsts.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  static Widget textButton({required text, required func, required color}) {
    return InkWell(
      onTap: func,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
