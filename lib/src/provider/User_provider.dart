import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:mindcomposure/src/Database/DatabaseService.dart';
import 'package:mindcomposure/src/model/UserApp.dart';
import 'package:uuid/uuid.dart';

class UserProvider with ChangeNotifier {
  final firestoreService = DatabaseService();
  String _userID, _email, _fullName, _name, _age, _telNo, _role, _userImage;

  var uuid = Uuid();

  //getter

  String get email => _email;
  String get fullName => fullName;
  String get name => _name;
  String get age => _age;
  String get telNo => telNo;
  String get role => _role;
  String get userImage => _userImage;
  Stream<List<UserApp>> get person => firestoreService.getUser();

  //Setter
  set changeEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set changeName(String name) {
    _name = name;
    notifyListeners();
  }

  set changeFullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  set changeAge(String age) {
    _age = age;
    notifyListeners();
  }

  set changeTelNo(String telNo) {
    _telNo = telNo;
    notifyListeners();
  }

  set changeRole(String role) {
    _role = role;
    notifyListeners();
  }

  set changeUserImage(String userImage) {
    _userImage = userImage;
    notifyListeners();
  }

  //Function
  //Insert all data into database
  loadAll(UserApp person) {
    if (person != null) {
      _userID = person.userID;
      _email = person.email;
      _fullName = person.fullName;
      _name = person.name;
      _age = person.age;
      _telNo = person.telNo;
      _role = person.role;
      _userImage = person.userImage;
    } else {
      _userID = null;
      _email = null;
      _fullName = null;
      _name = null;
      _age = null;
      _telNo = null;
      _role = null;
      _userImage = null;
    }
  }

  //Saved data
  // empty userId
  savedUser() {
    if (_userID == null) {
      //add
      var newPerson = UserApp(
          userID: uuid.v1(),
          email: _email,
          fullName: _fullName,
          name: _name,
          age: _age,
          telNo: _telNo,
          role: _role,
          userImage: _userImage);
      firestoreService.setUser(newPerson);
    } else {
      var updatedPerson = UserApp(
          userID: _userID,
          email: _email,
          fullName: _fullName,
          name: _name,
          age: _age,
          telNo: _telNo,
          role: _role,
          userImage: _userImage);
      firestoreService.setUser(updatedPerson);
    }
  }

  //edit

  //RemoveUser
  removeUser(String userID) {
    firestoreService.deleteUser(userID);
  }

  //  Edit using Future
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('UserApp');

  CollectionReference getAllUser() {
    return userCollection;
  }

  Future<UserApp> getUserByID(String id) async =>
      await firestoreService.fetchUser(id);

  List<UserApp> snapshotToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<UserApp> userList =
        snapshot.data.docs?.map((e) => UserApp.fromJson(e.data()))?.toList();
    return userList;
  }
}
