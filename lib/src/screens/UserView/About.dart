import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/animation/FadeIn.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final List<List<String>> intro = [
    [
      'assets/Intro_1.png',
      'Overview',
      'An mobile application that helps the students in coping stress by using UTM counsellor`s guideline',
    ],
    [
      'assets/Intro_2.png',
      'Analyze your stress level',
      'The stress level is determined by Depression Anxiety Stress Scale (DASS) which is consist of 25 questionnaire.',
    ],
    [
      'assets/Intro_3.png',
      'Practice breathing technique',
      'Provide easy and understandable intructions of 5 different breathing techniques',
    ],
    [
      'assets/Intro_4.png',
      'Practice yoga poses',
      'Provide and understandable easy intructions of 5 different yoga poses',
    ],
    [
      'assets/Intro_5.png',
      'Read balanced food intake fact',
      'Provide useful balance food intake facts that might suprised you',
    ],
    [
      'assets/Intro_6.png',
      'Customize your happy photos',
      'Upload all your happy photos and view it to forget your stress',
    ],
    [
      'assets/Intro_7.png',
      'Participate offline discussion',
      'Perform stress-related discussion with expert without booking the meeting',
    ],
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 246, 234, 212),
      body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              previous();
            } else if (details.velocity.pixelsPerSecond.dx < 0) {
              next();
            }
          },
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Align(
                      child: Image.asset(intro[currentIndex][0], scale: 1.8),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 90,
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: _buildIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, 0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: FadeIn(
                      2.5,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            intro[currentIndex][1],
                            style: GoogleFonts.concertOne(
                              fontSize: 21,
                              color: Color.fromARGB(250, 180, 125, 34),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 15),
                          Stack(
                            children: <Widget>[
                              Text(
                                intro[currentIndex][2],
                                style: GoogleFonts.courgette(
                                  fontSize: 12.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                child: Text("Let's get started"),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(250, 180, 125, 34))),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

// Indicator slide
  Widget indicator(bool isActive) {
    return Expanded(
      child: Container(
          height: 4,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:
                  isActive ? Color.fromARGB(250, 180, 125, 34) : Colors.white)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < intro.length; i++) {
      if (currentIndex == i) {
        indicators.add(indicator(true));
      } else {
        indicators.add(indicator(false));
      }
    }
    return indicators;
  }

  void next() {
    setState(() {
      if (currentIndex < intro.length - 1) {
        currentIndex++;
      } else
        currentIndex = currentIndex;
    });
  }

  void previous() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else
        currentIndex = 0;
    });
  }
}
