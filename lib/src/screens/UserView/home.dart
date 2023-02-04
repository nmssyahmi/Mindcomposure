import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';
import 'package:mindcomposure/src/screens/DiscussionScreen/ChatRoomScreen.dart';
import 'package:mindcomposure/src/screens/SubHome/AnalyzeSliverPage.dart';
import 'package:mindcomposure/src/screens/SubHome/ForumSliverPage.dart';
import 'package:mindcomposure/src/screens/SubHome/HomeSliverPage.dart';
import 'package:mindcomposure/src/screens/SubHome/TreatementSliverPage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tab = [
    HomeSliverPage(),
    AnalyzeSliverPage(),
    TreatmentSliverPage(),
    ForumSliverPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 246, 234, 212),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        curve: Curves.easeOutCirc,
        animationDuration: Duration(milliseconds: 1000),
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.assessment_rounded),
              title: Text(
                'DASS',
                style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.medical_services_rounded),
              title: Text(
                'Treatment',
                style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.forum_rounded),
              title: Text(
                'Forum',
                style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              activeColor: Colors.white,
              inactiveColor: Colors.black),
        ],
      ),
      body: tab[currentIndex],
    );
  }

  proceedChat() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    final user = await UserProvider().getUserByID(userCredential.uid);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChatRoomScreen(userCredential.uid, user.name, user.role)));
  }
}
