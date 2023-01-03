import 'dart:async';
import 'package:dsc_web/components/button.dart';
import 'package:dsc_web/components/headers.dart';
import 'package:dsc_web/constants/colors.dart';
import 'package:dsc_web/constants/config.dart';
import 'package:dsc_web/constants/questions.dart';
import 'package:dsc_web/constants/units.dart';
import 'package:dsc_web/models/user.model.dart';
import 'package:dsc_web/repo/quiz.repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuizAptitudePage extends StatefulWidget {
  final UserModel model;
  final int timeLeft;
  QuizAptitudePage({required this.model, required this.timeLeft});
  @override
  _QuizAptitudePageState createState() => _QuizAptitudePageState();
}

class _QuizAptitudePageState extends State<QuizAptitudePage> {
  PageController controller = new PageController();
  int page = 0;
  late int _start;

  @override
  void initState() {
    super.initState();
    _start = widget.timeLeft;
    startTimer();
    QuizRepo.testStarted(widget.model.mail);
  }

  void startTimer() async {
    if (!this.mounted) return;

    try {
      await Future.delayed(new Duration(minutes: 1));
      if (_start <= 0) {
        QuizRepo.timeUp(context, widget.model);
        return;
      }
      print("timer is going $_start");
      setState(() {
        _start--;
      });
      startTimer();
    } catch (e) {
      // print("error here");
    }
  }

  prev(i) {
    if (i > 0) {
      setState(() {
        page = i - 1;
        controller.jumpToPage(i - 1);
        // controller.animateToPage(i - 1,
        //     duration: new Duration(milliseconds: 800),
        //     curve: Curves.fastLinearToSlowEaseIn);
      });
      QuizRepo.updatePref();
    }
  }

  next(i) {
    if (i < QuestionBank.list.length) {
      setState(() {
        page = i + 1;
        controller.jumpToPage(i + 1);
        // controller.animateToPage(i + 1,
        //     duration: new Duration(milliseconds: 800), curve: Curves.fastLinearToSlowEaseIn);
      });
      QuizRepo.updatePref();
    }
  }

  jumpToI(i) {
    if (i > 0 && i < QuestionBank.list.length) {
      controller.jumpToPage(i);
      setState(() {
        page = i;
      });
      QuizRepo.updatePref();
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
        body: Container(
          child: Column(
            children: [
              kIsWeb ? SizedBox(height: 2) : SizedBox(height: kToolbarHeight + 10),
              Container(
                margin: EdgeInsets.only(left: UnitConsts.hzMargin, right: UnitConsts.hzMargin, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _start > ConfigConsts.endTestButtonVisiblefromEndMins
                        ? SizedBox()
                        : Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: () => QuizRepo.endTest(context, widget.model),
                                child: Headers.functionButtons(
                                  icondata: Icons.close,
                                  color: ColorConsts.red,
                                  text: 'End Test',
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: 20),
                    Headers.smallGreyHeader('${QuestionBank.list[page].domain} Quiz'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Headers.bigWhiteHeader('Question ${page + 1}/${QuestionBank.list.length}'),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Spacer(),
                        _start > ConfigConsts.testDurationLastmins
                            ? Headers.functionButtons(
                                icondata: Icons.lock_clock,
                                color: ColorConsts.white80,
                                text: '$_start min(s) left',
                              )
                            : Headers.functionButtons(
                                icondata: Icons.lock_clock,
                                color: ColorConsts.red,
                                text: _start < 2 ? 'Last minute remaining' : '$_start min(s) left',
                              ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SmoothPageIndicator(
                      controller: controller,
                      count: QuestionBank.list.length,
                      effect: WormEffect(
                        dotColor: ColorConsts.grey,
                        activeDotColor: ColorConsts.yellow,
                        dotHeight: 7,
                        dotWidth: 15,
                      ),
                      onDotClicked: jumpToI,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    for (int i = 0; i < QuestionBank.list.length; i++)
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: UnitConsts.hzMargin, vertical: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Headers.normalTexts(QuestionBank.list[i].question),
                              SizedBox(height: 15),
                              QuestionBank.list[i].code != '' ? Headers.codeBox(QuestionBank.list[i].code) : SizedBox(),
                              SizedBox(height: 15),
                              QuestionBank.list[i].isMCQ
                                  ? Column(
                                      children: [
                                        for (var option in QuestionBank.list[i].options)
                                          optionCard(
                                            option,
                                            option == QuestionBank.list[i].userMarkedOption,
                                            i,
                                          ),
                                      ],
                                    )
                                  : TextFormField(
                                      initialValue: QuestionBank.list[i].userMarkedOption,
                                      onChanged: (val) {
                                        setState(() {
                                          QuestionBank.list[i].userMarkedOption = val;
                                        });
                                      },
                                      style: TextStyle(
                                        fontSize: UnitConsts.fontNormal,
                                        color: ColorConsts.white80,
                                      ),
                                      maxLines: 5,
                                      minLines: 3,
                                    ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    (i == QuestionBank.list.length - 1 ? 0.20 : 0.15),
                              ),
                              i == QuestionBank.list.length - 1
                                  ? lastQuestionButtons(i)
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        i == 0
                                            ? SizedBox()
                                            : ElevatedButtonCustom.textButton(
                                                text: 'Previous', func: () => prev(i), color: ColorConsts.blue),
                                        SizedBox(width: 20),
                                        ElevatedButtonCustom.smallButton(
                                            text: 'Next', func: () => next(i), color: ColorConsts.blue),
                                      ],
                                    ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lastQuestionButtons(int i) {
    return Column(
      children: [
        ElevatedButtonCustom.bigButton(
          text: 'End Quiz',
          func: () => QuizRepo.submitSolutions(context, widget.model),
          color: ColorConsts.blue,
        ),
        SizedBox(height: 15),
        ElevatedButtonCustom.textButton(
          text: 'Previous',
          func: () => prev(i),
          color: ColorConsts.blue,
        ),
      ],
    );
  }

  Widget optionCard(option, bool selected, int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          QuestionBank.list[i].userMarkedOption = option;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? ColorConsts.green : ColorConsts.white80.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            selected
                ? Headers.normalTexts(option, color: ColorConsts.green)
                : Headers.normalTexts(option, color: ColorConsts.white80),
            Spacer(),
            CircleAvatar(
              radius: 6,
              backgroundColor: selected ? ColorConsts.green : ColorConsts.white80.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
