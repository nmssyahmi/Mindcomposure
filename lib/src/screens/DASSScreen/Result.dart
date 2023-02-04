import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mindcomposure/src/model/DASSQuestion.dart';

class ResultScreen extends StatefulWidget {
  final int stress;
  final int anxiety;
  final int depression;
  final String stressDesc;
  final String anxietyDesc;
  final String depreDesc;
  final String currentDateTime;

  ResultScreen({
    @required this.stress,
    @required this.anxiety,
    @required this.depression,
    @required this.stressDesc,
    @required this.anxietyDesc,
    @required this.depreDesc,
    @required this.currentDateTime,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " DASS Result",
            style: GoogleFonts.courgette(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
            child: Text(
              "Guideline:\n"
              "Normal ............................. Level 1\n"
              "Mild ................................. Level 2\n"
              "Moderate........................... Level 3\n"
              "Severe............................... Level 4\n"
              "Extreme Severe.................. Level 5\n",
              style: GoogleFonts.ptSerif(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20),
          //Date and Time
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              " Date(YYYY-MM-DD) and Time: " +
                  widget.currentDateTime.toString(),
              style: GoogleFonts.courgette(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            children: [
              //Stress
              Container(
                margin: EdgeInsets.only(top: 15, left: 5),
                width: 170,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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
                child: Column(children: [
                  Text(
                    "Stress result\n\n      " +
                        widget.stress.toString() +
                        "/42\n",
                    style: GoogleFonts.courgette(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.stressDesc,
                    style: GoogleFonts.courgette(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
              ),
              SizedBox(width: 5),
              Container(
                width: 170,
                margin: EdgeInsets.only(
                  top: 15,
                  right: 5,
                  left: 5,
                ),
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
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(children: [
                  Text(
                    "Anxiety result\n\n       " +
                        widget.anxiety.toString() +
                        "/42\n",
                    style: GoogleFonts.courgette(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.anxietyDesc,
                    style: GoogleFonts.courgette(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
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
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            margin: EdgeInsets.only(
              top: 2,
              bottom: 5,
              left: 5,
              right: 5,
            ),
            child: Column(children: [
              Text(
                "Depression result\n\n          " +
                    widget.depression.toString() +
                    "/42\n",
                style: GoogleFonts.courgette(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.depreDesc,
                style: GoogleFonts.courgette(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
