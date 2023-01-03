import 'package:dsc_web/components/dsclogo.dart';
import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/repo/auth.repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConsts.white,
        body: ScreenTypeLayout(
          mobile: ui(true),
          desktop: ui(false),
        ),
      ),
    );
  }

  Widget ui(bool isMobile) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: ColorConsts.white,
        image: DecorationImage(
          image: AssetImage('assets/login_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Spacer(),
              Container(
                width: isMobile ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.35,
                padding: EdgeInsets.all(isMobile ? 25 : 40),
                decoration: BoxDecoration(
                  color: ColorConsts.dark,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: kElevationToShadow[4],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        helloThere(isMobile ? 27 : 35),
                        Spacer(),
                        DSCLogo(isSmall: true),
                      ],
                    ),
                    SizedBox(height: 60),
                    Center(
                      child: GestureDetector(
                        onTap: () => AuthRepo.gsignin(context),
                        child: Container(
                          child: Image(
                            image: AssetImage('assets/google.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  Column helloThere(size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: ColorConsts.white,
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
        Row(
          children: [
            Text(
              'There',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: ColorConsts.white,
                fontWeight: FontWeight.bold,
                fontSize: size,
              ),
            ),
            SizedBox(width: 2),
            Container(
              height: size - 10,
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: ColorConsts.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
