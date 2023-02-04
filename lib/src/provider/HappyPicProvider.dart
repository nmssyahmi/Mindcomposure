import 'package:flutter/widgets.dart';
import 'package:mindcomposure/src/Database/HappyPicDatabase.dart';
import 'package:mindcomposure/src/model/HappyPic.dart';
import 'package:uuid/uuid.dart';

class HappyPicProvider with ChangeNotifier {
  final firestoreService = HappyPicDatabase();
  String _userID, _happyPicID, _url;
  var uuid = Uuid();

  //getter

  String get happyPicID => _happyPicID;
  String get url => _url;

  Stream<List<HappyPic>> get data => firestoreService.getHappyPic();

  //Setter
  set changeUrl(String url) {
    _url = url;
    notifyListeners();
  }

  //Function
  //Insert all data into database
  loadAll(HappyPic happy) {
    if (happy != null) {
      _userID = happy.userID;
      _happyPicID = happy.happyPicID;
      _url = happy.url;
    } else {
      _userID = null;
      _happyPicID = null;
      _url = null;
    }
  }

  //Saved data
  // empty Pic ID
  savedHappyPic() {
    if (_happyPicID == null) {
      //add
      var newPic = HappyPic(
        happyPicID: uuid.v1(),
        userID: _userID,
        url: _url,
      );
      firestoreService.setHappyPic(newPic);
    } else {
      var updatedPic = HappyPic(
        happyPicID: _happyPicID,
        userID: _userID,
        url: _url,
      );
      firestoreService.setHappyPic(updatedPic);
    }
  }

  //edit

  //RemovePic
  removeHappyPic(String happyPicID) {
    firestoreService.deleteHappyPic(happyPicID);
  }
}
