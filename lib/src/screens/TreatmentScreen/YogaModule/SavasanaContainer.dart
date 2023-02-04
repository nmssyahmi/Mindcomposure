import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavasanaContainer extends StatefulWidget {
  @override
  _SavasanaContainerState createState() => _SavasanaContainerState();
}

class _SavasanaContainerState extends State<SavasanaContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('WelcomeYogaSavasana');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
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
              'assets/Yoga/Savasana/1.png',
              scale: 6.0,
            )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Corpse Pose (Savasana)',
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
