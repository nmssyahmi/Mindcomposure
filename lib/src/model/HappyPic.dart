class HappyPic {
  String userID, url, happyPicID;

  HappyPic({
    this.userID,
    this.url,
    this.happyPicID,
  });

//Create Json into FireStore
  factory HappyPic.fromJson(Map<String, dynamic> json) {
    return HappyPic(
      userID: json['userID'],
      url: json['url'],
      happyPicID: json['happyPicID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'url': url,
      'HappyPicID': happyPicID,
    };
  }
}
