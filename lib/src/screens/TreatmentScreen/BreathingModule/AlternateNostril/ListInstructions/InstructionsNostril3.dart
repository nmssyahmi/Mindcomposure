import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/AlternateNostril/ListInstructions/InstructionsNostril4.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/ListInstruction.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

class InstructionNostril3 extends StatefulWidget {
  @override
  _InstructionNostril3State createState() => _InstructionNostril3State();
}

class _InstructionNostril3State extends State<InstructionNostril3> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.6);
    flutterTts.setPitch(1.2);
    flutterTts.speak(instructionsNostril[3]);
    Timer(const Duration(seconds: 21), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => InstructionNostril4()));
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
        padding: EdgeInsets.only(left: 60, right: 40),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.60,
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
                instructionsNostril[3],
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
