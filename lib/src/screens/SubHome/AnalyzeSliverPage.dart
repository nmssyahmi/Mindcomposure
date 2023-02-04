import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/widgets/DASSNavyWidget/ExamGrid.dart';
import 'package:mindcomposure/src/widgets/DASSNavyWidget/DisclaimerContainer.dart';
import 'package:mindcomposure/src/widgets/DASSNavyWidget/ReportContainer.dart';
import 'package:mindcomposure/src/widgets/SliverAppBar.dart';

class AnalyzeSliverPage extends StatefulWidget {
  @override
  _AnalyzeSliverPageState createState() => _AnalyzeSliverPageState();
}

class _AnalyzeSliverPageState extends State<AnalyzeSliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBarWidget(),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            DisclaimerContainer(),
            SizedBox(height: 20),
            Text(
              " Measure stress level with DASS",
              style: GoogleFonts.courgette(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            [
              ExamGrid(),
              ReportContainer(),
            ],
          ),
        ),
      ]),
    );
  }
}
