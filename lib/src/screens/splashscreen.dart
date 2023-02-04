import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mindcomposure/src/screens/loginUser.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color.fromARGB(250, 233, 242, 235)),
      child: Center(
        child: Image.asset('assets/logo.png', scale: 2.0),
      ),
    ));
  }
}
