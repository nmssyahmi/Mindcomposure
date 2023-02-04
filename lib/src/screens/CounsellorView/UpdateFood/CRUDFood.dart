import 'package:flutter/material.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/GridContainer/createFood.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/GridContainer/deleteFood.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/GridContainer/updateFood.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/GridContainer/viewFood.dart';

class CRUDFood extends StatefulWidget {
  @override
  _CRUDFoodState createState() => _CRUDFoodState();
}

class _CRUDFoodState extends State<CRUDFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " Customize Food Facts",
            style: GoogleFonts.courgette(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            [
              CreateFood(),
              UpdateFood(),
              DeleteFood(),
              ViewFood(),
            ],
          ),
        ),
      ]),
    );
  }
}
