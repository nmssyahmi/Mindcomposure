import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';
import 'package:mindcomposure/src/screens/UserView/registerUser.dart';
import 'package:mindcomposure/src/screens/reset.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future _checkUser() async {
    User firebaseUser = auth.currentUser;
    print('FIREBASEUSER: $firebaseUser');

    if (firebaseUser != null) {
      final user = await UserProvider().getUserByID(firebaseUser.uid);
      if (user.role == "Counsellor") {
        Navigator.of(context).pushReplacementNamed('AdminHomepage');
      } else if (user.role == "User") {
        Navigator.of(context).pushReplacementNamed('Home');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset('assets/logo.png'),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '\nLogin',
                    style: GoogleFonts.courgette(
                      fontSize: 22,
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none),
                      onChanged: (value) {
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
                  //sign in button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: Text("Sign In"),
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
                            _signin(email, password);
                          }
                        }),
                  ),
                  //Forget password
                  TextButton(
                    child: Text('Forget the password?',
                        style: GoogleFonts.breeSerif(color: Colors.blue)),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ResetScreen())),
                  ),
                  // New User
                  Container(
                    margin: EdgeInsets.only(top: 99),
                    child: TextButton(
                        child: Text("Dont Have An Account yet? Create Now",
                            style: GoogleFonts.breeSerif(
                                color: Color.fromARGB(250, 61, 122, 135))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterUserScreen()));
                        }),
                  ),
                ])),
          ),
        ],
      ),
    );
  }

  _signin(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential != null) {
        final user = await UserProvider().getUserByID(userCredential.user.uid);
        if (user.email == email) {
          if (user.role == "Counsellor") {
            Navigator.of(context).pushReplacementNamed('AdminHomepage');
          } else if (user.role == "User") {
            Navigator.of(context).pushReplacementNamed('Home');
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      var snackBar = SnackBar(content: Text(e.message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e.message);
    }
  }
}
