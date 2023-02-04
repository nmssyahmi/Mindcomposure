import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mindcomposure/src/model/UserApp.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';

import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class CreateProfileScreen extends StatefulWidget {
  final UserApp person;

  CreateProfileScreen({this.person});

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final userNameController = TextEditingController();
  final userTelNoController = TextEditingController();
  final userAgeController = TextEditingController();
  final userFullNameController = TextEditingController();
  firebase_storage.Reference ref;
  bool showError = false;

  File _image;
  String _fullName, _name, _age, _telNo;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(250, 61, 122, 135),
          title: Center(
            child: Text(
              " View your profile profile",
              style: GoogleFonts.courgette(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0),
                //Error
                showError
                    ? Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Please fill up the incomplete form.",
                          style: GoogleFonts.ptSerif(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Container(),
                //Pic profile
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        chooseImage();
                      },
                      child: (_image == null)
                          ? CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.black,
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "Tap the container to insert your new profile picture.",
                                  style: GoogleFonts.ptSerif(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          : CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.black,
                              backgroundImage: FileImage(_image),
                            )),
                ),
                SizedBox(height: 2.0),
                // FullName
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      controller: userFullNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none),
                      onChanged: (value) {
                        _fullName = value.trim();
                        userProvider.changeFullName = value;
                      }),
                ),
                SizedBox(height: 2.0),
                // Username
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none),
                      onChanged: (value) {
                        userProvider.changeName = value;
                        _name = value.trim();
                      }),
                ),
                SizedBox(
                  height: 2.0,
                ),
                // Age
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      controller: userAgeController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Age',
                          prefixIcon: Icon(Icons.face_rounded),
                          border: InputBorder.none),
                      onChanged: (value) {
                        userProvider.changeAge = value;
                        _age = value.trim();
                      }),
                ),
                SizedBox(height: 2.0),
                // TelNo
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                      controller: userTelNoController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Telephone Number',
                          prefixIcon: Icon(Icons.phone),
                          border: InputBorder.none),
                      onChanged: (value) {
                        userProvider.changeTelNo = value;
                        _telNo = value.trim();
                      }),
                ),
                SizedBox(height: 5.0),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  minWidth: 2000,
                  child: ElevatedButton(
                      child: Text("Save Profile"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40),
                          backgroundColor: Color.fromARGB(250, 61, 122, 135)),
                      onPressed: () {
                        if (_image == null) {
                          setState(() {
                            showError = true;
                          });
                        }
                        if (_fullName == null) {
                          setState(() {
                            showError = true;
                          });
                        }
                        if (_name == null) {
                          setState(() {
                            showError = true;
                          });
                        }
                        if (_age == null) {
                          setState(() {
                            showError = true;
                          });
                        }
                        if (_telNo == null) {
                          setState(() {
                            showError = true;
                          });
                        } else if (_image != null &&
                            _fullName != null &&
                            _name != null &&
                            _age != null &&
                            _telNo != null) {
                          setState(() {
                            showError = false;
                          });
                          firebase_storage.Reference ref;

                          ref = firebase_storage.FirebaseStorage.instance
                              .ref()
                              .child('UserPic/${Path.basename(_image.path)}');
                          print('url:$_image');
                          ref.putFile(_image).whenComplete(() async {
                            await ref.getDownloadURL().then((value) {
                              print('url:$value');

                              userProvider.changeUserImage = value;

                              userProvider.savedUser();
                            });
                          });
                          Navigator.of(context).pushReplacementNamed('Intro');
                        }
                      }),
                ),
              ],
            )),
      ),
    );
  }

  chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile?.path);
    });
    if (pickedFile.path == null) retrieveLostData();
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
