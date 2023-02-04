import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:mindcomposure/src/model/UserApp.dart';
import 'package:mindcomposure/src/provider/User_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userNameController = TextEditingController();
  final userTelNoController = TextEditingController();
  final userAgeController = TextEditingController();
  final userFullNameController = TextEditingController();

  String _fullName, _name, _age, _telNo;
  bool showError = false;
  firebase_storage.Reference ref;
  File _image;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " Edit Your Profile",
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
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                " You are not required to fill all the form ,just fill the form that you desired only",
                style: GoogleFonts.courgette(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
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
                      userProvider.changeFullName = value;
                      _fullName = value.trim();
                    }),
              ),
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
              SizedBox(height: 20.0),
              FutureBuilder(
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
                        shrinkWrap: true,
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                              child: Text("Update Profile"),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),
                                  backgroundColor:
                                      Color.fromARGB(250, 61, 122, 135)),
                              onPressed: () {
                                firebase_storage.Reference ref;
                                //Fullname Empty
                                if (_fullName == null) {
                                  _fullName = documents[index].get('fullName');
                                  print('fullName  empty');
                                }
                                //Username Empty
                                if (_name == null) {
                                  _name = documents[index].get('name');
                                  print('username empty');
                                } //Age Empty
                                if (_age == null) {
                                  _age = documents[index].get('age');
                                  print('age empty');
                                }
                                //TelNo Empty
                                if (_telNo == null) {
                                  _telNo = documents[index].get('telNo');
                                  print('age empty');
                                }
                                //ProfilePic Empty

                                if (_image == null || _image.path.isEmpty) {
                                  var _person = UserApp(
                                      userID: documents[index].get('userID'),
                                      userImage:
                                          documents[index].get('userImage'),
                                      email: documents[index].get('email'),
                                      role: documents[index].get('role'),
                                      fullName: _fullName,
                                      name: _name,
                                      age: _age,
                                      telNo: _telNo);
                                  userProvider.loadAll(_person);
                                  userProvider.savedUser();
                                  var snackBar = SnackBar(
                                      content: Text(
                                          " Your profile has being updated. Please press back button and click this page again to see any changes"));
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
                                          'UserPic/${Path.basename(_image.path)}');
                                  print('url:$_image');
                                  ref.putFile(_image).whenComplete(() async {
                                    await ref.getDownloadURL().then((value) {
                                      print('url:$value');
                                      var _person = UserApp(
                                          userID:
                                              documents[index].get('userID'),
                                          userImage: value,
                                          email: documents[index].get('email'),
                                          role: documents[index].get('role'),
                                          fullName: _fullName,
                                          name: _name,
                                          age: _age,
                                          telNo: _telNo);
                                      userProvider.loadAll(_person);
                                      userProvider.savedUser();
                                      var snackBar = SnackBar(
                                          content: Text(
                                              " Your profile has being updated"));
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
