import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindcomposure/src/model/Food.dart';
import 'package:mindcomposure/src/provider/FoodProvider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as Path;

class UpdateFoodPage extends StatefulWidget {
  @override
  _UpdateFoodPageState createState() => _UpdateFoodPageState();
}

class _UpdateFoodPageState extends State<UpdateFoodPage> {
  String foodName;
  String formula;
  String foodDesc;
  final foodNameController = TextEditingController();
  final foodIngredientController = TextEditingController();
  final foodDescController = TextEditingController();
  File _image;
  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " Update Food Fact",
            style: GoogleFonts.courgette(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),

              Text(
                " Fill the food fact form and click the button below based on the food name that need updated."
                " You are not required to fill all the form ,just fill the form that you desired only",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  chooseImage();
                },
                child: (_image == null)
                    ? Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: 200,
                        child: Center(
                          child: Text(
                            '\nNo food photo is selected.\nPlease tap this screen.\nPlease use photo resolution of 1920x1280.',
                            style: GoogleFonts.courgette(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: 200,
                        child: Image.file(
                          _image,
                          scale: 3.0,
                        )),
              ),
              SizedBox(
                height: 10,
              ),
              //Food Name
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: foodNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'Food Name',
                      prefixIcon: Icon(Icons.food_bank_rounded),
                      border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      foodProvider.changeFoodName = value;
                      foodName = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              //Food key formula
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: foodIngredientController,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      prefixIcon: null,
                      hintText:
                          'Secret Formula. Example: Vitamin C,Iron and etc',
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      foodProvider.changeKeyIngredient = value;
                      formula = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              //Food Desc
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: foodDescController,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Food Description',
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      foodProvider.changeFoodDesc = value;
                      foodDesc = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection('Food').get(),
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
                          return ElevatedButton(
                              child: Text("Update  " +
                                  documents[index].get('foodName')),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),
                                  backgroundColor:
                                      Color.fromARGB(250, 61, 122, 135)),
                              onPressed: () {
                                firebase_storage.Reference ref;
                                //Foodname Empty
                                if (foodName == null) {
                                  foodName = documents[index].get('foodName');
                                  print('food empty');
                                }
                                //FoodDesc Empty
                                if (foodDesc == null) {
                                  foodDesc = documents[index].get('foodDesc');
                                  print('desc empty');
                                } //FoodformulaEmpty
                                if (formula == null) {
                                  formula =
                                      documents[index].get('keyIngredient');
                                  print('formula empty');
                                } //FoodPic Empty

                                if (_image == null || _image.path.isEmpty) {
                                  var _food = Food(
                                      foodID: documents[index].get('foodID'),
                                      foodImg: documents[index].get('foodImg'),
                                      foodName: foodName,
                                      keyIngredient: formula,
                                      foodDesc: foodDesc);
                                  foodProvider.loadAll(_food);
                                  foodProvider.savedFood();
                                  var snackBar = SnackBar(
                                      content: Text(
                                          documents[index].get('foodName') +
                                              " has being updated"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.of(context).pop();
                                }
                                // image exist
                                else if (_image != null ||
                                    _image.path.isNotEmpty) {
                                  ref = firebase_storage
                                      .FirebaseStorage.instance
                                      .ref()
                                      .child(
                                          'foodPic/${Path.basename(_image.path)}');
                                  print('url:$_image');
                                  ref.putFile(_image).whenComplete(() async {
                                    await ref.getDownloadURL().then((value) {
                                      print('url:$value');
                                      var _food = Food(
                                          foodID:
                                              documents[index].get('foodID'),
                                          foodImg: value,
                                          foodName: foodName,
                                          keyIngredient: formula,
                                          foodDesc: foodDesc);
                                      foodProvider.loadAll(_food);
                                      foodProvider.savedFood();
                                      var snackBar = SnackBar(
                                          content: Text(
                                              documents[index].get('foodName') +
                                                  " has being updated"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.of(context).pop();
                                    });
                                  });
                                }
                              });
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      // _image.add(File(pickedFile?.path));
      _image = File(pickedFile?.path);
    });
    if (pickedFile.path == null) retrieveLostData();
    return _image;
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker().retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file.path);
      });
    } else {
      print(response.file);
    }
  }
}
