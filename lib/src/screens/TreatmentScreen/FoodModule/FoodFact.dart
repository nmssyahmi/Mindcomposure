import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodFactScreen extends StatefulWidget {
  @override
  _FoodFactScreenState createState() => _FoodFactScreenState();
}

class _FoodFactScreenState extends State<FoodFactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " Food Facts ",
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
              .collection('Food')
              // .where('userID', isEqualTo: userCredential.uid)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final documents = snapshot.data.docs;
            print('DOCS  ${documents.length}');

            return Container(
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(250, 218, 200, 182),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: double.infinity,
                                      child: Image.network(
                                        documents[index].get('foodImg'),
                                        scale: 2.0,
                                        width: double.infinity,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      documents[index].get('foodName'),
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      "Secret Ingredient:\n\n" +
                                          documents[index].get('keyIngredient'),
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      "Food Description:\n\n" +
                                          documents[index].get('foodDesc'),
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ]);
                    }));
          }),
    );
  }
}
