import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(250, 233, 242, 235),
        body: Container(
            margin: EdgeInsets.only(left: 75, right: 20, top: 240),
            child: Column(
              children: <Widget>[
                Text('Email Verification \n',
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                Text('An email has sented to you.',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )),
                Text('Please check it.',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            )));
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    try {
      await user.reload();

      if (user.emailVerified) {
        timer.cancel();
        Navigator.of(context).pushReplacementNamed('CreateProfile');
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
    }
  }
}
