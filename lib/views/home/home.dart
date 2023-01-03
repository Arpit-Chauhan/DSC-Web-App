import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_web/blocs/home.bloc.dart';
import 'package:dsc_web/components/button.dart';
import 'package:dsc_web/components/dsclogo.dart';
import 'package:dsc_web/components/headers.dart';
import 'package:dsc_web/components/toast.dart';
import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/constants/config.dart';
import 'package:dsc_web/constants/strings.dart';
import 'package:dsc_web/constants/units.dart';
import 'package:dsc_web/events/home.event.dart';
import 'package:dsc_web/models/user.model.dart';
import 'package:dsc_web/repo/auth.repo.dart';
import 'package:dsc_web/repo/quiz.repo.dart';
import 'package:dsc_web/states/home.state.dart';
import 'package:dsc_web/views/home/quiz_aptitude.dart';
import 'package:dsc_web/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeEventLoadData());
  }

  void startTestFunc(UserModel model, DateTime endtime) {
    Duration left = endtime.difference(DateTime.now());
    // print(left.inMinutes);
    if (left.inMinutes >= 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizAptitudePage(
            model: model,
            timeLeft: left.inMinutes,
          ),
        ),
      );
    } else {
      ToastPreset.err(str: 'No Time Left', context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: ColorConsts.dark,
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (ctx, state) {},
          builder: (ctx, HomeState state) {
            if (state is HomeStateLoading) {
              return Center(child: Text('LOADING', style: TextStyle(color: Colors.white)));
            }
            if (state is HomeStateError) {
              return Center(child: Text('ERROR ${state.message}', style: TextStyle(color: Colors.white)));
            }
            if (state is HomeStateUnAuthenticated) {
              return Center(
                child: Column(
                  children: [
                    Spacer(),
                    Text('Please login first', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    ElevatedButtonCustom.smallButton(
                        text: 'Login Now',
                        func: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                        },
                        color: ColorConsts.red),
                    Spacer(),
                  ],
                ),
              );
            }

            if (state is HomeStateLoaded) {
              return ScreenTypeLayout(
                mobile: ui(state, true),
                desktop: ui(state, false),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget ui(HomeStateLoaded state, isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: UnitConsts.hzMargin * 1.5, vertical: 0),
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
                      child: Headers.smallGreyHeader('Welcome ${state.userModel.name}'),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Headers.bigWhiteHeader('General Instructions'),
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
                        Headers.smallGreyHeader('Welcome ${state.userModel.name}'),
                        Headers.bigWhiteHeader('General Instructions'),
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
          SizedBox(height: 40),
          isMobile
              ? Expanded(
                  child: infoScroller(),
                )
              : Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 6, child: Container(child: infoScroller())),
                      SizedBox(width: 100),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              image: AssetImage('assets/home_bg.png'),
                              scale: 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection(ConfigConsts.testTimeColl).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  QuerySnapshot qs = snapshot.data as QuerySnapshot;
                  Timestamp startTimeStamp = qs.docs[0].get(ConfigConsts.startTimeField);
                  DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(startTimeStamp.microsecondsSinceEpoch);
                  // DateTime endTime = startTime.add(new Duration(minutes: ConfigConsts.testDurationMins));
                  DateTime endTime = startTime.add(ConfigConsts.testDuration);

                  DateTime current = DateTime.now();
                  var s = state.userModel.testStatus;

                  if (current.isBefore(startTime)) {
                    return proceedButton('WAIT', startTime, endTime, ColorConsts.grey, () {}, s);
                  } else if (current.isAfter(startTime) && current.isBefore(endTime)) {
                    if (state.userModel.testStatus == ConfigConsts.testEnded) {
                      return proceedButton('TEST SUBMITTED', startTime, endTime, ColorConsts.grey, () {}, "$s in time");
                    } else if (state.userModel.testStatus == ConfigConsts.testStarted) {
                      return proceedButton('CONTINUE', startTime, endTime, ColorConsts.green, () async {
                        await QuizRepo.restoreData(context);
                        startTestFunc(state.userModel, endTime);
                      }, s);
                    } else {
                      return proceedButton('PROCEED', startTime, endTime, ColorConsts.green,
                          () => startTestFunc(state.userModel, endTime), s);
                    }
                  } else if (current.isAfter(endTime)) {
                    if (state.userModel.testStatus == ConfigConsts.testEnded) {
                      return proceedButton('TEST SUBMITTED', startTime, endTime, ColorConsts.grey, () {}, s);
                    } else {
                      return proceedButton('TEST ENDED', startTime, endTime, ColorConsts.grey, () {}, s);
                    }
                  }
                  return SizedBox();
                } catch (e) {
                  return SizedBox();
                }
              } else {
                return SizedBox();
              }
            },
          ),
          SizedBox(height: 30),
        ],
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
            for (var point in StringConsts.generalInfo)
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Headers.normalTexts(point),
              ),
          ],
        ),
      ),
    );
  }

  Column proceedButton(status, DateTime startTime, DateTime endTime, color, func, userTestStatus) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () {
                final snackBar = SnackBar(
                  content: Text(
                    '$status \nStart Time : ${startTime.toString()} \nEnd time : ${endTime.toString()} \nUser $userTestStatus',
                    style: TextStyle(
                      color: ColorConsts.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: ColorConsts.white80,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Headers.functionButtons(
                icondata: Icons.info,
                color: ColorConsts.yellow,
                text: 'Test Info',
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ScreenTypeLayout(
          mobile: ElevatedButtonCustom.bigButton(
            text: status,
            func: func,
            color: color,
          ),
          desktop: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButtonCustom.bigButton(
              text: status,
              func: func,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
