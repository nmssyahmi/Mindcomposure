import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/widgets/HomeNavyWidget/ContainerDiscussion.dart';
import 'package:mindcomposure/src/widgets/SliverAppBar.dart';

class ForumSliverPage extends StatefulWidget {
  @override
  _ForumSliverPageState createState() => _ForumSliverPageState();
}

class _ForumSliverPageState extends State<ForumSliverPage> {
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
                " Let's express your stress",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ContainerDiscussion(),
            ])),
          ],
        ));
  }
}
