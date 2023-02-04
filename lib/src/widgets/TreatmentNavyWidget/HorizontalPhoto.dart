import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalPhoto extends StatefulWidget {
  @override
  _HorizontalPhotoState createState() => _HorizontalPhotoState();
}

class _HorizontalPhotoState extends State<HorizontalPhoto> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('HappyPhoto');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.26,
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
                  "Photo Collection",
                  style: GoogleFonts.workSans(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 85,
              ),
              Center(child: Image.asset('assets/Intro_6.png')),
            ],
          ),
        ),
      ),
    );
  }
}
