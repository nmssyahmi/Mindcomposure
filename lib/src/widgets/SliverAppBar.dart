import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/model/UserApp.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';
import 'package:mindcomposure/src/screens/UserView/About.dart';
import 'package:mindcomposure/src/screens/ViewProfile.dart';

class SliverAppBarWidget extends StatefulWidget {
  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    return SliverAppBar(
      pinned: true,
      backgroundColor: Color.fromARGB(250, 61, 122, 135),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      expandedHeight: 100.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutScreen()));
        },
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
      actions: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewProfile()));
            },
            child: FutureBuilder<UserApp>(
                future: UserProvider().getUserByID(userCredential.uid),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(snapshot.data.userImage),
                  );
                }),
          ),
        ),
        TextButton(
            onPressed: () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              try {
                await auth.signOut();
                Navigator.pushReplacementNamed(context, 'Login');
              } catch (e) {
                print(e);
              }
            },
            child: Text("Sign out"))
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: FutureBuilder<UserApp>(
            future: UserProvider().getUserByID(userCredential.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return Text("Hi ${snapshot.data.name}",
                  style: GoogleFonts.courgette(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ));
            }),
        centerTitle: true,
      ),
    );
  }
}
