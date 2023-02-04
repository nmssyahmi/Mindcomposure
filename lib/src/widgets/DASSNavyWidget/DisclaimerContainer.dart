import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisclaimerContainer extends StatefulWidget {
  @override
  _DisclaimerContainerState createState() => _DisclaimerContainerState();
}

class _DisclaimerContainerState extends State<DisclaimerContainer> {
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
                  "Disclaimer:\n",
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
                  "DASS(Depression and Anxiety Stress Scale) only acts as guideline for determine stress,anxiety and depression level. You are advisable to visit the experts or counsellors for better accuracy stress result.   ",
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
