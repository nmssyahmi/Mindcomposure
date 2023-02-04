import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcomposure/src/model/UserApp.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //read
  Stream<List<UserApp>> getUser() {
    return _db.collection('UserApp').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserApp.fromJson(doc.data())).toList());
  }
  //insert and Update

  Future<UserApp> fetchUser(String userID) {
    return _db
        .collection('UserApp')
        .doc(userID)
        .get()
        .then((snapshot) => UserApp.fromJson(snapshot.data()));
  }

  Future<void> setUser(UserApp person) {
    var options = SetOptions(merge: true);
    return _db
        .collection('UserApp')
        .doc(person.userID)
        .set(person.toMap(), options);
  }

  //delete
  Future<void> deleteUser(String userID) {
    return _db.collection('UserApp').doc(userID).delete();
  }
}
