import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/DolphinPoses/ListInstruction/Dolphin2.dart';
import 'dart:async';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/ListYogaInstruction.dart';

class InstructionDolphin1 extends StatefulWidget {
  @override
  _InstructionDolphin1State createState() => _InstructionDolphin1State();
}

class _InstructionDolphin1State extends State<InstructionDolphin1> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.6);
    flutterTts.setPitch(1.2);
    flutterTts.speak(yogaInstructionsDolphin[1]);
    Timer(const Duration(seconds: 9), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => InstructionDolphin2()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      body: Container(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child:
                    Image.asset('assets/Yoga/DolphinPlank/1.png', scale: 3.0)),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                color: Color.fromARGB(250, 218, 200, 182),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                yogaInstructionsDolphin[1],
                style: GoogleFonts.ptSerif(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
