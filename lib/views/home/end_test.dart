import 'package:dsc_web/components/button.dart';
import 'package:dsc_web/components/dsclogo.dart';
import 'package:dsc_web/components/headers.dart';
import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/constants/strings.dart';
import 'package:dsc_web/constants/units.dart';
import 'package:dsc_web/repo/auth.repo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class EndTestPage extends StatefulWidget {
  @override
  _EndTestPageState createState() => _EndTestPageState();
}

class _EndTestPageState extends State<EndTestPage> {
  Future _urllaunch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ui(true),
      desktop: ui(false),
    );
  }

  Widget ui(isMobile) {
    return WillPopScope(
      onWillPop: () async {
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: ColorConsts.dark,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: UnitConsts.hzMargin * 2.5, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kToolbarHeight + 10),
              isMobile
                  ? Column(
                      children: [
                        Align(alignment: Alignment.topRight, child: DSCLogo(isSmall: true)),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Headers.smallGreyHeader('Hurray!!'),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Headers.bigWhiteHeader('End of the Quiz'),
                            Spacer(),
                            InkWell(
                              onTap: () => AuthRepo.logout(context),
                              child: Headers.functionButtons(
                                icondata: Icons.logout,
                                color: ColorConsts.red,
                                text: 'Logout',
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(padding: EdgeInsets.only(bottom: 4), child: DSCLogo(isSmall: true)),
                        SizedBox(width: 60),
                        Column(
                          children: [
                            Headers.smallGreyHeader('Hurray!!'),
                            Headers.bigWhiteHeader('End of the Quiz'),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => AuthRepo.logout(context),
                          child: Headers.functionButtons(
                            icondata: Icons.logout,
                            color: ColorConsts.red,
                            text: 'Logout',
                          ),
                        ),
                      ],
                    ),
              isMobile
                  ? Expanded(child: infoScroller())
                  : Expanded(
                      child: Row(
                        children: [
                          Expanded(flex: 6, child: Container(child: infoScroller())),
                          SizedBox(width: 100),
                          Expanded(flex: 3, child: SizedBox()),
                        ],
                      ),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ScreenTypeLayout(
                mobile: ElevatedButtonCustom.bigButton(
                    text: 'VISIT GDSC AKGEC',
                    func: () {
                      _urllaunch('https://www.dscakgec.org/');
                    },
                    color: ColorConsts.green),
                desktop: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButtonCustom.bigButton(
                      text: 'VISIT GDSC AKGEC',
                      func: () {
                        _urllaunch('https://www.dscakgec.org/');
                      },
                      color: ColorConsts.green),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView infoScroller() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.check_circle_rounded,
                color: ColorConsts.green,
                size: 150,
              ),
            ),
            SizedBox(height: 20),
            for (var point in StringConsts.quizEnd)
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Headers.normalTexts(point),
              ),
          ],
        ),
      ),
    );
  }
}
