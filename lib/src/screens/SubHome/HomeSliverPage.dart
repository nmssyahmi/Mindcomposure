import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerDass.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerDiscussion.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ListTreament.dart';
import 'package:mindcomposure/src/widgets/SliverAppBar.dart';

class HomeSliverPage extends StatefulWidget {
  @override
  _HomeSliverPageState createState() => _HomeSliverPageState();
}

class _HomeSliverPageState extends State<HomeSliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(250, 233, 242, 235),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBarWidget(),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              SizedBox(height: 20),
              Text(
                " Measure stress level with DASS",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              StressExam(),
              SizedBox(height: 30),
              Text(
                " Ways to cope the stress",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: ListTreatment(),
              ),
              SizedBox(height: 30),
              Text(
                " Let's talk to random people and expert",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ContainerDiscussion(),
              SizedBox(height: 20),
            ])),
          ],
        ));
  }
}
