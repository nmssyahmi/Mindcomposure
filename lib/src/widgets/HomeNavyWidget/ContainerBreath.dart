import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerScroll extends StatefulWidget {
  @override
  _ContainerScrollState createState() => _ContainerScrollState();
}

class _ContainerScrollState extends State<ContainerScroll> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('ListBreathing');
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        margin: EdgeInsets.only(top: 10, right: 20),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Image.asset('assets/Intro_3.png', scale: 5.08)),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Breathing Technique",
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
      ),
    );
  }
}
