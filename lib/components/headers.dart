import 'package:blinking_text/blinking_text.dart';
import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/constants/units.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headers {
  static Widget smallGreyHeader(text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: ColorConsts.white80,
          fontWeight: FontWeight.w500,
          fontSize: UnitConsts.fontNormal,
        ),
      ),
    );
  }

  static Widget bigWhiteHeader(text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: ColorConsts.white,
          fontWeight: FontWeight.bold,
          fontSize: UnitConsts.fontHeader,
        ),
      ),
    );
  }

  static Widget functionButtons({
    required IconData icondata,
    required Color color,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icondata, size: 15, color: color),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: UnitConsts.fontNormal,
          ),
        ),
      ],
    );
  }

  static Widget functionBlinkButton({
    required IconData icondata,
    required Color color,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icondata, size: 15, color: color),
        SizedBox(width: 4),
        BlinkText(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: UnitConsts.fontNormal,
          ),
          beginColor: color,
          endColor: ColorConsts.white80,
          times: 20,
          duration: Duration(milliseconds: 200),
        ),
      ],
    );
  }

  static Widget normalTexts(text, {FontWeight weight = FontWeight.w500, Color color = ColorConsts.white}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: UnitConsts.fontSmallHeader,
      ),
    );
  }

  static Widget codeBox(code) {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          "$code",
          style: TextStyle(
            color: ColorConsts.white80,
            fontWeight: FontWeight.bold,
            fontSize: UnitConsts.fontNormal,
            fontFamily: GoogleFonts.robotoMono().fontFamily,
          ),
        ),
      ),
    );
  }
}
