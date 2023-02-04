import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcomposure/src/model/HappyPic.dart';

class HappyPicDatabase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //read
  Stream<List<HappyPic>> getHappyPic() {
    return _db.collection('HappyPic').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => HappyPic.fromJson(doc.data())).toList());
  }
  //insert and Update

  Future<HappyPic> fetchHappyPic(String happyPicID) {
    return _db
        .collection('HappyPic')
        .doc(happyPicID)
        .get()
        .then((snapshot) => HappyPic.fromJson(snapshot.data()));
  }

  Future<void> setHappyPic(HappyPic happy) {
    var options = SetOptions(merge: true);
    return _db
        .collection('HappyPic')
        .doc(happy.happyPicID)
        .set(happy.toMap(), options);
  }

  //delete
  Future<void> deleteHappyPic(String happyPicID) {
    return _db.collection('HappyPic').doc(happyPicID).delete();
  }
}
