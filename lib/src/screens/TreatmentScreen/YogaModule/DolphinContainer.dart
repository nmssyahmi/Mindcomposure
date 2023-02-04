import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DolphinContainer extends StatefulWidget {
  @override
  _DolphinContainerState createState() => _DolphinContainerState();
}

class _DolphinContainerState extends State<DolphinContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('WelcomeYogaDolphin');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
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
                child:
                    Image.asset('assets/Yoga/DolphinPlank/3.png', scale: 1.0)),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Dolphin Plank Poses',
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
