import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/constants.dart';
import 'package:mindcomposure/src/model/DASSQuestion.dart';
import 'package:mindcomposure/src/provider/DASS_provider.dart';
import 'package:mindcomposure/src/screens/DASSScreen/Question/question.dart';
import 'package:mindcomposure/src/screens/DASSScreen/Result.dart';
import 'package:provider/provider.dart';

class AnswerTestScreen extends StatefulWidget {
  @override
  _AnswerTestScreenState createState() => _AnswerTestScreenState();
}

class _AnswerTestScreenState extends State<AnswerTestScreen> {
  int indexView = 0;
  bool showError = false;
  DASSQuestion dass;
  List<Question> _questions = questions;
  List<QuestionWidget> questionWidgets = [];
  Widget view = Container();
  ScrollController _scrollController = ScrollController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _questions.forEach((e) => e.score = -1);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    view = Column(
      children: [
        QuestionWidget(
          index: indexView,
          question: _questions[indexView],
          callback: updateScore,
        ),
        QuestionWidget(
          index: indexView + 1,
          question: _questions[indexView + 1],
          callback: updateScore,
        ),
        QuestionWidget(
          index: indexView + 2,
          question: _questions[indexView + 2],
          callback: updateScore,
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async {
        if (indexView > 0) {
          setState(() => indexView -= 3);
          _scrollController.jumpTo(0);
          return false;
        }

        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(250, 233, 242, 235),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Please read each statement and select an answer which indicates how much the statement applied to you. There are no right or wrong answers.",
                  style: GoogleFonts.ptSerif(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              showError
                  ? Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Please answer all questions.",
                        style: GoogleFonts.ptSerif(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Container(),
              view,
              SizedBox(height: 10),
              (indexView + 3) < _questions.length
                  ? ElevatedButton(
                      child: Container(
                          width: double.infinity,
                          child: Center(child: Text("Next"))),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(250, 61, 122, 135))),
                      onPressed: () {
                        if (_questions[indexView].score != -1 &&
                            _questions[indexView + 1].score != -1 &&
                            _questions[indexView + 2].score != -1) {
                          setState(() {
                            indexView += 3;
                            showError = false;
                          });
                        } else {
                          setState(() => showError = true);
                        }
                        _scrollController.jumpTo(0);
                      })
                  : ElevatedButton(
                      child: Container(
                          width: double.infinity,
                          child: Center(child: Text("Finalise"))),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(250, 61, 122, 135))),
                      onPressed: () {
                        finaliseScore();
                      }),
            ],
          ),
        ),
      ),
    );
  }

  void updateScore(int index, int score) {
    setState(() => _questions[index].score = score);
  }

  void finaliseScore() {
    final dassProvider = Provider.of<DASSProvider>(context, listen: false);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    print('USERCREDENTIAL: $userCredential');
    int stress = 0, anxiety = 0, depression = 0;
    String stressDesc = '';
    String anxietyDesc = '';
    String depreDesc = '';
    DateTime currentDateTime;
    _questions.forEach((e) {
      switch (e.type) {
        case 'STRESS':
          stress += e.score;
          break;
        case 'ANXIETY':
          anxiety += e.score;
          break;
        case 'DEPRESSION':
          depression += e.score;
          break;
        default:
      }
    });
    //calculation of dass
    stress = stress * 2;
    anxiety = anxiety * 2;
    depression = depression * 2;

    currentDateTime = DateTime.now();
    String convertedDateTime =
        "${currentDateTime.year.toString()}-${currentDateTime.month.toString().padLeft(2, '0')}-${currentDateTime.day.toString().padLeft(2, '0')}    ${currentDateTime.hour.toString()}:${currentDateTime.minute.toString()}";
    stressDesc = resultStress(stress, stressDesc);
    anxietyDesc = resultAnxiety(anxiety, anxietyDesc);
    depreDesc = resultDepression(depression, depreDesc);

    var _data = DASSQuestion(
      userID: userCredential.uid,
      stress: stress,
      stressDesc: stressDesc,
      anxiety: anxiety,
      anxietyDesc: anxietyDesc,
      depression: depression,
      depreDesc: depreDesc,
      currentDateTime: convertedDateTime,
    );

    dassProvider.loadAll(_data);
    dassProvider.savedData();

    print('STRESS     : $stress');
    print('STRESS RESULT:$stressDesc');
    print('ANXIETY    : $anxiety');
    print('ANXIETY    : $anxietyDesc');
    print('DEPRESSION : $depression');
    print('DEPRESSION : $depreDesc');
    print('DEPRESSION : $currentDateTime');

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ResultScreen(
              stress: stress,
              anxiety: anxiety,
              depression: depression,
              stressDesc: stressDesc,
              anxietyDesc: anxietyDesc,
              depreDesc: depreDesc,
              currentDateTime: convertedDateTime,
            )));
  }

  String resultStress(int stress, String stressDesc) {
    // Normal ............................. 0-10
    // Mild .................................. 11-18
    // Moderate ......................... 19-26
    // Severe ............................. 27-34
    // Extremely severe............. 35-42

    if (stress > -1 && stress < 11) {
      stressDesc = "Normal";
    } else if (stress > 10 && stress < 19) {
      stressDesc = "Mild";
    } else if (stress > 18 && stress < 27) {
      stressDesc = "Moderate";
    } else if (stress > 26 && stress < 35) {
      stressDesc = "Severe";
    } else if (stress > 34 && stress < 43) {
      stressDesc = "Extreme Severe";
    }
    return stressDesc;
  }

  String resultAnxiety(int anxiety, String anxietyDesc) {
    // Normal ............................. 0-6
    // Mild .................................. 7-9
    // Moderate......................... 10-14
    // Severe............................. 15-19
    // Extremely severe............. 20-42

    if (anxiety > -1 && anxiety < 7) {
      anxietyDesc = "Normal";
    } else if (anxiety > 6 && anxiety < 10) {
      anxietyDesc = "Mild";
    } else if (anxiety > 9 && anxiety < 15) {
      anxietyDesc = "Moderate";
    } else if (anxiety > 14 && anxiety < 20) {
      anxietyDesc = "Severe";
    } else if (anxiety > 19 && anxiety < 43) {
      anxietyDesc = "Extreme Severe";
    }
    return anxietyDesc;
  }

  String resultDepression(int depression, String depreDesc) {
    // Normal ............................. 0-9
    // Mild.................................. 10-12
    // Moderate......................... 13-20
    // Severe............................. 21-27
    // Extremely severe............. 28-42

    if (depression > -1 && depression < 10) {
      depreDesc = "Normal";
    } else if (depression > 9 && depression < 13) {
      depreDesc = "Mild";
    } else if (depression > 12 && depression < 21) {
      depreDesc = "Moderate";
    } else if (depression > 20 && depression < 28) {
      depreDesc = "Severe";
    } else if (depression > 27 && depression < 43) {
      depreDesc = "Extreme Severe";
    }
    return depreDesc;
  }
}
