import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/screens/EditProfile.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(250, 61, 122, 135),
          title: Center(
            child: Text(
              " View your profile",
              style: GoogleFonts.courgette(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      body: Container(
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('UserApp')
                .where('userID', isEqualTo: userCredential.uid)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final documents = snapshot.data.docs;
              print('DOCS  ${documents.length}');
              return ListView.builder(
                  padding: EdgeInsets.only(bottom: 80, top: 16),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 100,
                            backgroundImage:
                                NetworkImage(documents[index].get('userImage')),
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(height: 20),
                          //fullname
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                "FULLNAME: " + documents[index].get('fullName'),
                                style: GoogleFonts.workSans(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          //username
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                "NAME: " + documents[index].get('name'),
                                style: GoogleFonts.workSans(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          //age
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                "AGE: " + documents[index].get('age'),
                                style: GoogleFonts.workSans(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          //Telno
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                "TELEPHONE NO: " +
                                    documents[index].get('telNo'),
                                style: GoogleFonts.workSans(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                "ROLE: " + documents[index].get('role'),
                                style: GoogleFonts.workSans(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                              child: Text(" Edit Profile"),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),
                                  backgroundColor:
                                      Color.fromARGB(250, 61, 122, 135)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()));
                              }),
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
