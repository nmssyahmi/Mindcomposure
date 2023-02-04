import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/PhotoCollection/AddImage.dart';
import 'package:mindcomposure/src/screens/TreatmentScreen/PhotoCollection/DetailsScreen.dart';
import 'package:transparent_image/transparent_image.dart';

class HappyPhoto extends StatefulWidget {
  @override
  _HappyPhotoState createState() => _HappyPhotoState();
}

class _HappyPhotoState extends State<HappyPhoto> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    print('USERCREDENTIAL: $userCredential');
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(250, 61, 122, 135),
          title: Center(
            child: Text(
              " My personal happy photos ",
              style: GoogleFonts.courgette(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddImage(userID: userCredential.uid)));
          setState(() {});
        },
        child: Icon(Icons.add_a_photo_rounded),
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
      ),
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('HappyPic')
            .where('userID', isEqualTo: userCredential.uid)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final documents = snapshot.data.docs;
          print('DOCS  ${documents.length}');

          return Container(
            padding: EdgeInsets.all(4),
            child: GridView.builder(
                itemCount: documents.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(documents[index].get('url'))));
                    },
                    child: Container(
                      margin: EdgeInsets.all(3),
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: documents[index].get('url')),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
