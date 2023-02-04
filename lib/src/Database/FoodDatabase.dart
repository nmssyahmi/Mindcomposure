import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcomposure/src/model/Food.dart';

class FoodDatabase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //read
  Stream<List<Food>> getFood() {
    return _db.collection('Food').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
  }
  //insert and Update

  Future<Food> fetchFood(String foodID) {
    return _db
        .collection('Food')
        .doc(foodID)
        .get()
        .then((snapshot) => Food.fromJson(snapshot.data()));
  }

  Future<void> setFood(Food f) {
    var options = SetOptions(merge: true);
    return _db.collection('Food').doc(f.foodID).set(f.toMap(), options);
  }

  //delete
  Future<void> deleteFood(String foodID) {
    return _db.collection('Food').doc(foodID).delete();
  }
}
