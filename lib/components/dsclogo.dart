import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/constants/units.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSCLogo extends StatelessWidget {
  final bool isSmall;
  DSCLogo({this.isSmall = false});

  @override
  Widget build(BuildContext contex) {
    return Container(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/image 2.png'),
            fit: BoxFit.contain,
            height: isSmall ? 40 : 50,
            width: isSmall ? 50 : 70,
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              'GDSC AKGEC',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: ColorConsts.white,
                fontSize: isSmall ? UnitConsts.fontSmaller : UnitConsts.fontSmallHeader,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
