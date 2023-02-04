import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportHistory extends StatefulWidget {
  @override
  _ReportHistoryState createState() => _ReportHistoryState();
}

class _ReportHistoryState extends State<ReportHistory> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " My DASS Report History ",
            style: GoogleFonts.courgette(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('DASSQuestion')
              .where('userID', isEqualTo: userCredential.uid)
              .orderBy('currentDateTime', descending: true)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final documents = snapshot.data.docs;
            print('DOCS  ${documents.length}');

            return
                // Column(children: <Widget>[

                Container(
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                //Guideline DASS Result
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  margin: EdgeInsets.only(
                                      top: 15, right: 20, left: 10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.26,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(
                                            4, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "Guideline:\n"
                                    "Normal ............................. Level 1\n"
                                    "Mild ................................. Level 2\n"
                                    "Moderate........................... Level 3\n"
                                    "Severe............................... Level 4\n"
                                    "Extreme Severe.................. Level 5\n",
                                    style: GoogleFonts.ptSerif(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " Date(YYYY-MM-DD) and Time: " +
                                        documents[index].get('currentDateTime'),
                                    style: GoogleFonts.courgette(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    //Stress
                                    Container(
                                      margin: EdgeInsets.only(top: 15, left: 5),
                                      width: 170,
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(250, 218, 200, 182),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 3,
                                            offset: Offset(4,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(children: [
                                        Text(
                                          "Stress result\n\n      " +
                                              documents[index]
                                                  .get('stress')
                                                  .toString() +
                                              "/42\n",
                                          style: GoogleFonts.courgette(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          documents[index].get('stressDesc'),
                                          style: GoogleFonts.courgette(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 170,
                                      margin: EdgeInsets.only(
                                        top: 15,
                                        right: 5,
                                        left: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(250, 218, 200, 182),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 3,
                                            offset: Offset(4,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: Column(children: [
                                        Text(
                                          "Anxiety result\n\n       " +
                                              documents[index]
                                                  .get('anxiety')
                                                  .toString() +
                                              "/42\n",
                                          style: GoogleFonts.courgette(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          documents[index].get('anxietyDesc'),
                                          style: GoogleFonts.courgette(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(250, 218, 200, 182),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(
                                            4, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 20, right: 20),
                                  margin: EdgeInsets.only(
                                    top: 2,
                                    bottom: 5,
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: Column(children: [
                                    Text(
                                      "Depression result\n\n          " +
                                          documents[index]
                                              .get('depression')
                                              .toString() +
                                          "/42\n",
                                      style: GoogleFonts.courgette(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      documents[index].get('depreDesc'),
                                      style: GoogleFonts.courgette(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                                ),
                              ]);
                        }));
            // ]);
          }),
    );
  }
}
