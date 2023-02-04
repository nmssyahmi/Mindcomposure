import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LegUpContainer extends StatefulWidget {
  @override
  _LegUpContainerState createState() => _LegUpContainerState();
}

class _LegUpContainerState extends State<LegUpContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('WelcomeYogaLegUp');
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
            Center(
                child: Image.asset(
              'assets/Yoga/wall/2.png',
              scale: 5.2,
            )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Leg-Up-Wall pose',
                style: GoogleFonts.workSans(
                  fontSize: 13,
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
