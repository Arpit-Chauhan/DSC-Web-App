// import 'package:dsc_web/components/button.dart';
// import 'package:dsc_web/components/headers.dart';
// import 'package:dsc_web/constants/colors.dart';
// import 'package:dsc_web/constants/questions.dart';
// import 'package:dsc_web/constants/strings.dart';
// import 'package:dsc_web/constants/units.dart';
// import 'package:dsc_web/models/question.model.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class QuizPage extends StatefulWidget {
//   final String domain;
//   QuizPage({required this.domain});
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   List<QuestionModel> qlist = [];
//   PageController controller = new PageController();
//   int page = 0;
//   String quizName = '';
//   int quizIndex = 0;
//   String domainSelected = '';

//   @override
//   void initState() {
//     super.initState();
//     page = 0;
//     qlist = QuestionBank.aptiQs;
//     quizName = StringConsts.aptitude;
//     domainSelected = widget.domain;
//   }

//   changeQs(newQuizName, newList) {
//     if (quizName == StringConsts.aptitude) {
//       setState(() {
//         quizIndex = 1;
//         page = 0;
//         controller.jumpToPage(0);
//         qlist = newList;
//         quizName = newQuizName;
//       });
//     } else {
//       setState(() {
//         quizIndex = 2;
//         domainSelected = newQuizName;
//         page = 0;
//         controller.jumpToPage(0);
//         qlist = newList;
//         quizName = newQuizName;
//       });
//     }
//   }

//   prev(i) {
//     if (i > 0) {
//       setState(() {
//         page = i - 1;
//         controller.animateToPage(i - 1,
//             duration: new Duration(milliseconds: 1200), curve: Curves.fastLinearToSlowEaseIn);
//       });
//     }
//   }

//   next(i) {
//     // if (i < QuestionBank.aptiQs.length) {
//     if (i < qlist.length) {
//       setState(() {
//         page = i + 1;
//         controller.animateToPage(i + 1,
//             duration: new Duration(milliseconds: 1200), curve: Curves.fastLinearToSlowEaseIn);
//       });
//     }
//   }

//   jumpToI(i) {
//     setState(() {
//       page = i;
//       controller.animateToPage(i - 1, duration: new Duration(milliseconds: 1200), curve: Curves.fastLinearToSlowEaseIn);
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConsts.dark,
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: kToolbarHeight + 10),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: UnitConsts.hzMargin, vertical: 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           // TODO : End Test
//                         },
//                         child: Headers.functionButtons(
//                           icondata: Icons.close,
//                           color: ColorConsts.red,
//                           text: 'End Test',
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Headers.smallGreyHeader('$quizName Quiz'),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       // Headers.bigWhiteHeader('Question ${page + 1}/${QuestionBank.aptiQs.length}'),
//                       Headers.bigWhiteHeader('Question ${page + 1}/${qlist.length}'),
//                       Spacer(),
//                       InkWell(
//                         onTap: () {
//                           // TODO : Show  Picker
//                           // changeQs()
//                         },
//                         child: Headers.functionButtons(
//                           icondata: Icons.edit,
//                           color: ColorConsts.yellow,
//                           text: 'Change Domain',
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     children: [
//                       Spacer(),
//                       Headers.functionButtons(
//                         icondata: Icons.time_to_leave,
//                         color: ColorConsts.white80,
//                         text: 'Time Rem.: 120 mins',
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   SmoothPageIndicator(
//                     controller: controller,
//                     count: qlist.length,
//                     effect: WormEffect(
//                       activeDotColor: ColorConsts.red,
//                       dotHeight: 5,
//                       dotWidth: 5,
//                     ),
//                     onDotClicked: jumpToI,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: PageView(
//                 physics: NeverScrollableScrollPhysics(),
//                 controller: controller,
//                 children: [
//                   for (int i = 0; i < qlist.length; i++)
//                     SingleChildScrollView(
//                       physics: BouncingScrollPhysics(),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: UnitConsts.hzMargin, vertical: 0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Headers.normalTexts(qlist[i].question),
//                             SizedBox(height: 15),
//                             qlist[i].code != '' ? Headers.codeBox(qlist[i].code) : SizedBox(),
//                             SizedBox(height: 15),
//                             for (var option in qlist[i].options) optionCard(option, actualList(). ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * (i == qlist.length - 1 ? 0.20 : 0.15),
//                             ),
//                             i == 0 && quizIndex == 2
//                                 ? firstQuestionOfSecondQuiz(i)
//                                 : i == qlist.length - 1
//                                     ? lastQuestionButtons(i)
//                                     : Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           i == 0
//                                               ? SizedBox()
//                                               : ElevatedButtonCustom.textButton(
//                                                   text: 'Previous', func: () => prev(i), color: ColorConsts.blue),
//                                           SizedBox(width: 20),
//                                           ElevatedButtonCustom.smallButton(
//                                               text: 'Next', func: () => next(i), color: ColorConsts.blue),
//                                         ],
//                                       ),
//                             SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget lastQuestionButtons(int i) {
//     return Column(
//       children: [
//         quizIndex == 1
//             ? ElevatedButtonCustom.bigButton(
//                 text: 'Next Quiz',
//                 func: () {
//                   // TODO : ChangeQs()
//                 },
//                 color: ColorConsts.blue,
//               )
//             : ElevatedButtonCustom.bigButton(
//                 text: 'End Quiz',
//                 func: () {
//                   // TODO : End Quiz
//                 },
//                 color: ColorConsts.red,
//               ),
//         SizedBox(height: 15),
//         ElevatedButtonCustom.textButton(
//           text: 'Previous',
//           func: () => prev(i),
//           color: ColorConsts.blue,
//         ),
//       ],
//     );
//   }

//   Widget firstQuestionOfSecondQuiz(int i) {
//     return Column(
//       children: [
//         ElevatedButtonCustom.bigButton(
//           text: 'Previous Quiz',
//           func: () {
//             // TODO : ChangeQs()
//           },
//           color: ColorConsts.blue,
//         ),
//         SizedBox(height: 15),
//         ElevatedButtonCustom.textButton(
//           text: 'Next',
//           func: () => next(i),
//           color: ColorConsts.blue,
//         ),
//       ],
//     );
//   }

//   Widget optionCard(option, bool selected) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           // selected = option;
//           // TODO : Add answer here
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 8),
//         width: double.infinity,
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           border: Border.all(color: selected ? ColorConsts.green : ColorConsts.white80.withOpacity(0.5), width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             selected
//                 ? Headers.normalTexts(option, color: ColorConsts.green)
//                 : Headers.normalTexts(option, color: ColorConsts.white80),
//             Spacer(),
//             CircleAvatar(
//               radius: 6,
//               backgroundColor: selected ? ColorConsts.green : ColorConsts.white80.withOpacity(0.5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
