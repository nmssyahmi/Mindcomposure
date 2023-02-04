import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcomposure/src/model/DASSQuestion.dart';

class DASSDatabase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //read
  Stream<List<DASSQuestion>> getData() {
    return _db.collection('DASSQuestion').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => DASSQuestion.fromJson(doc.data())).toList());
  }
  //insert and Update

  Future<DASSQuestion> fetchData(String dassQuestionID) {
    return _db
        .collection('DASSQuestion')
        .doc(dassQuestionID)
        .get()
        .then((snapshot) => DASSQuestion.fromJson(snapshot.data()));
  }

  Future<void> setData(DASSQuestion question) {
    var options = SetOptions(merge: true);
    return _db
        .collection('DASSQuestion')
        .doc(question.dassQuestionID)
        .set(question.toMap(), options);
  }

  //delete
  Future<void> deleteData(String dassQuestionID) {
    return _db.collection('DASSQuestion').doc(dassQuestionID).delete();
  }
}
