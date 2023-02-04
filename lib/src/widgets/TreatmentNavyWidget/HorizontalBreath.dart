import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalBreathing extends StatefulWidget {
  @override
  _HorizontalBreathingState createState() => _HorizontalBreathingState();
}

class _HorizontalBreathingState extends State<HorizontalBreathing> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('ListBreathing');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.27,
        decoration: BoxDecoration(
          color: Color.fromARGB(250, 218, 200, 182),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Breathing Technique",
                  style: GoogleFonts.workSans(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 50),
              Center(child: Image.asset('assets/Intro_3.png')),
            ],
          ),
        ),
      ),
    );
  }
}
