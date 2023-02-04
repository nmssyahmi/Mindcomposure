import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:mindcomposure/src/Database/FoodDatabase.dart';
import 'package:mindcomposure/src/model/Food.dart';
import 'package:uuid/uuid.dart';

class FoodProvider with ChangeNotifier {
  final firestoreService = FoodDatabase();

  String _foodID, _foodName, _keyIngredient, _foodDesc;
  String _foodImg;

  var uuid = Uuid();

  //getter

  String get foodImg => _foodImg;
  String get keyIngredient => _keyIngredient;
  String get foodName => _foodName;
  String get foodDesc => _foodDesc;
  String get foodID => _foodID;
  Stream<List<Food>> get data => firestoreService.getFood();

  //Setter
  set changeFoodImg(String foodImg) {
    _foodImg = foodImg;
    notifyListeners();
  }

  set changeKeyIngredient(String keyIngredient) {
    _keyIngredient = keyIngredient;
    notifyListeners();
  }

  set changeFoodName(String foodName) {
    _foodName = foodName;
    notifyListeners();
  }

  set changeFoodDesc(String foodDesc) {
    _foodDesc = foodDesc;
    notifyListeners();
  }

  //Function
  //Insert all data into database
  loadAll(Food f) {
    if (f != null) {
      _foodID = f.foodID;
      _foodImg = f.foodImg;
      _foodName = f.foodName;
      _keyIngredient = f.keyIngredient;
      _foodDesc = f.foodDesc;
    } else {
      _foodID = null;
      _foodImg = null;
      _foodName = null;
      _keyIngredient = null;
      _foodDesc = null;
    }
  }

  //Saved data
  // empty foodId
  savedFood() {
    if (foodID == null) {
      //add
      var newFood = Food(
        foodID: uuid.v1(),
        foodImg: _foodImg,
        foodName: _foodName,
        keyIngredient: _keyIngredient,
        foodDesc: _foodDesc,
      );
      firestoreService.setFood(newFood);
    } else {
      var updatedFood = Food(
        foodID: _foodID,
        foodImg: _foodImg,
        foodName: _foodName,
        keyIngredient: _keyIngredient,
        foodDesc: _foodDesc,
      );
      firestoreService.setFood(updatedFood);
    }
  }

  //edit

  //RemoveUser
  removeFood(String foodID) {
    firestoreService.deleteFood(foodID);
  }

  //  Edit using Future
  CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('Food');

  CollectionReference getAllFood() {
    return foodCollection;
  }

  Future<Food> getUserByID(String id) async =>
      await firestoreService.fetchFood(id);

  List<Food> snapshotToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Food> userList =
        snapshot.data.docs?.map((e) => Food.fromJson(e.data()))?.toList();
    return userList;
  }
}
