import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteYoga extends StatefulWidget {
  @override
  _NoteYogaState createState() => _NoteYogaState();
}

class _NoteYogaState extends State<NoteYoga> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, right: 20, left: 10),
        height: MediaQuery.of(context).size.height * 0.26,
        decoration: BoxDecoration(
          color: Colors.black,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Notes:\n",
                  style: GoogleFonts.workSans(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'You are advisable to perform Corpse poses (Savasana) before stoping the yoga session.'
                  ' Cow poses are recommended to follow with cat poses'
                  ' Each yoga session advisable to repeat for 5 times per day',
                  style: GoogleFonts.workSans(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
