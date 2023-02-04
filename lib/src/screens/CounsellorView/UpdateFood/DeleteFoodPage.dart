import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/provider/FoodProvider.dart';

class DeleteFoodPage extends StatefulWidget {
  @override
  _DeleteFoodPageState createState() => _DeleteFoodPageState();
}

class _DeleteFoodPageState extends State<DeleteFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " Delete Food Fact",
            style: GoogleFonts.courgette(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('Food').get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final documents = snapshot.data.docs;
            print('DOCS  ${documents.length}');
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5),
                        //foodname
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(250, 218, 200, 182),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset:
                                    Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "FOOD NAME: " +
                                      documents[index].get('foodName'),
                                  style: GoogleFonts.workSans(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  FoodProvider().removeFood(
                                      documents[index].get('foodID'));
                                  var snackBar = SnackBar(
                                      content: Text(
                                          documents[index].get('foodName') +
                                              " has being deleted"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);

                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
