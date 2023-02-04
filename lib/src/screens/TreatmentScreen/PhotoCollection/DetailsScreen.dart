import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mindcomposure/src/provider/HappyPicProvider.dart';

class DetailScreen extends StatefulWidget {
  final String url;
  DetailScreen(this.url);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: GestureDetector(
            child: Center(
              child: Hero(
                tag: 'imageHero',
                child: Image.network(widget.url),
              ),
            ),
            onTap: () {
              print(widget.url);
              Navigator.of(context).pop();
            },
          )),
          FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('HappyPic')
                  .where("url", isEqualTo: widget.url)
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final documents = snapshot.data.docs;
                print('DOCS  ${documents.length}');
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            var imageID = snapshot.data.docs
                                .map((e) => e.id)
                                .toList()
                                .join();
                            print(imageID);

                            HappyPicProvider().removeHappyPic(imageID);

                            Navigator.of(context).pop();

                            final snackBar = SnackBar(
                                content: Text(
                                    "The selected pictured is deleted. Please press back button and click this page again for refresh latest photo"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                    });
              }),
        ],
      ),
    );
  }
}
