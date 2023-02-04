import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/DolphinContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/CatPosesContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/ChildPosesContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/CowPosesContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/NoteYoga.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/LegUpContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/ForwardFoldContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/Head-to-KneeContainer.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/YogaModule/SavasanaContainer.dart';
import 'package:mindcomposure/src/widgets/SliverAppBar.dart';

class YogaList extends StatefulWidget {
  @override
  _YogaListState createState() => _YogaListState();
}

class _YogaListState extends State<YogaList> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.6);
    flutterTts.setPitch(1.2);
    flutterTts.speak(" ");
  }

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
              " List of Yoga Poses",
              style: GoogleFonts.courgette(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10),
            NoteYoga(),
          ]),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            [
              DolphinContainer(),
              LegUpContainer(),
              ChildPosesContainer(),
              CowPosesContainer(),
              CatPosesContainer(),
              ForwardFoldContainer(),
              HeadtoKneeContainer(),
              SavasanaContainer(),
            ],
          ),
        ),
      ]),
    );
  }
}
