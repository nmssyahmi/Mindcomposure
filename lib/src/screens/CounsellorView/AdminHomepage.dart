import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/screens/CounsellorView/UpdateFood/CRUDFoodHomeCon.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerDiscussion.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ListTreament.dart';

import 'package:mindcomposure/src/widgets/SliverAppBar.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
                "  Customize Food Facts",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              CRUDFoodHomeCon(),
              SizedBox(height: 20),
              Text(
                "  Talk to Users",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ContainerDiscussion(),
              SizedBox(height: 20),
              Text(
                "  List of Treatment",
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
            ])),
          ],
        ));
  }
}
