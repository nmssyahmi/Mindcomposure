import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/widgets/SliverAppBar.dart';
import 'package:mindcomposure/src/widgets/TreatmentNavyWidget/ListTreatment.dart';

class TreatmentSliverPage extends StatefulWidget {
  @override
  _TreatmentSliverPageState createState() => _TreatmentSliverPageState();
}

class _TreatmentSliverPageState extends State<TreatmentSliverPage> {
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
                " Ways to cope the stress",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              ListTreatment(),
            ])),
          ],
        ));
  }
}
