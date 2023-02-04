import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/4-7-8Breathing/4-7-8Container.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/AbdominalBreathing/AbdominalBreathingContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/AlternateNostril/AlternateNostrilContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/EqualBreathing/EqualBreathingContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/ProgressiveMuscular/ProgressiveMuscularContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/BreathingModule/SkullShiningSkull/Skull-ShiningContainer.dart';
import 'package:mindcomposure/src/widgets/SliverAppBar.dart';

class ListBreathing extends StatefulWidget {
  @override
  _ListBreathingState createState() => _ListBreathingState();
}

class _ListBreathingState extends State<ListBreathing> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBarWidget(),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            SizedBox(height: 20),
            Text(
              " List of Breathing Technique",
              style: GoogleFonts.courgette(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
          ]),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            [
              EqualBreathingContainer(),
              AbdominalBreathingContainer(),
              ProgressiveMuscularContainer(),
              AlternateNostrilContainer(),
              DigitBreathingContainer(),
              SkullShiningContainer(),
            ],
          ),
        ),
      ]),
    );
  }
}
