import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcomposure/src/model/UserApp.dart';
import 'package:mindcomposure/src/screens/CounsellorView/registerCounsellor.dart';
import 'package:mindcomposure/src/screens/UserView/verify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';
import 'package:provider/provider.dart';

class RegisterUserScreen extends StatefulWidget {
  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final userEmailController = TextEditingController();
  User person;
  String email;
  String password;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: Color.fromARGB(250, 61, 122, 135),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70))),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/logo.png', scale: 2.0),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '\nRegister for User',
                    style: GoogleFonts.courgette(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(children: <Widget>[
                  //Email
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: userEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none),
                      onChanged: (value) {
                        userProvider.changeEmail = value;
                        email = value.trim();
                      },
                    ),
                  ),
                  //Password
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.vpn_key),
                          border: InputBorder.none),
                      onChanged: (value) {
                        password = value.trim();
                      },
                    ),
                  ),
                  //sign Up button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: Text("Sign Up"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(250, 61, 122, 135))),
                        onPressed: () {
                          if ((email == null || email.isEmpty) ||
                              (password == null || password.isEmpty)) {
                            final snackBar = SnackBar(
                                content: Text("Please fill up all the forms"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            _signup(email, password);
                          }
                        }),
                  ),
                ])),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Click here if you are a counsellor',
          style: GoogleFonts.ptSerif(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        icon: Icon(
          Icons.group,
          color: Colors.white,
        ),
        onPressed: () {
          // navigation ke counsellor register page
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => RegisterCounsellorScreen()));
        },
      ),
    );
  }

  _signup(String email, String password) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var stud =
          UserApp(userID: authResult.user.uid, email: email, role: "User");
      await userProvider.loadAll(stud);

      //Successfully sign up
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text(e.message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e.message);
    }
  }
}
