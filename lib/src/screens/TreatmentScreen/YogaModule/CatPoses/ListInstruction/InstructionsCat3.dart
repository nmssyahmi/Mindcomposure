import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/CatPoses/ListInstruction/InstructionsCat4.dart';
import 'dart:async';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/ListYogaInstruction.dart';

class InstructionCat3 extends StatefulWidget {
  @override
  _InstructionCat3State createState() => _InstructionCat3State();
}

class _InstructionCat3State extends State<InstructionCat3> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.6);
    flutterTts.setPitch(1.2);
    flutterTts.speak(yogaInstructionsCat[3]);
    Timer(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => InstructionCat4()));
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
            Center(child: Image.asset('assets/Yoga/Cat/3.png', scale: 3.0)),
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
                yogaInstructionsCat[3],
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
