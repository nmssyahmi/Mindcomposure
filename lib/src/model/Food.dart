class Food {
  String foodID, foodName, keyIngredient, foodDesc;
  String foodImg;

  Food(
      {this.foodID,
      this.foodImg,
      this.foodName,
      this.keyIngredient,
      this.foodDesc});

//Create Json into FireStore
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        foodID: json['foodID'],
        foodImg: json['foodImg'],
        foodName: json['foodName'],
        keyIngredient: json['keyIngredient'],
        foodDesc: json['foodDesc']);
  }

  Map<String, dynamic> toMap() {
    return {
      'foodID': foodID,
      'foodImg': foodImg,
      'foodName': foodName,
      'keyIngredient': keyIngredient,
      'foodDesc': foodDesc,
    };
  }
}
