import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamGrid extends StatefulWidget {
  @override
  _ExamGridState createState() => _ExamGridState();
}

class _ExamGridState extends State<ExamGrid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('AnswerTest');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        height: MediaQuery.of(context).size.height * 0.20,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: Image.asset('assets/Intro_2.png', scale: 5.08)),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Answers DASS ",
                style: GoogleFonts.workSans(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
