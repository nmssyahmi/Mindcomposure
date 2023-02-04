import 'package:flutter/widgets.dart';
import 'package:mindcomposure/src/Database/DASSDatabase.dart';
import 'package:mindcomposure/src/model/DASSQuestion.dart';
import 'package:uuid/uuid.dart';

class DASSProvider with ChangeNotifier {
  final firestoreService = DASSDatabase();
  int _stress;
  String _stressDesc;
  int _anxiety;
  String _anxietyDesc;
  int _depression;
  String _depreDesc;
  String _dassQuestionID;
  String userID;
  String _currentDateTime;
  var uuid = Uuid();

  //getter

  int get stress => _stress;
  String get stressDesc => _stressDesc;
  int get anxiety => _anxiety;
  String get anxietyDesc => _anxietyDesc;
  int get depression => _depression;
  String get depreDesc => _depreDesc;
  String get dassQuestionID => _dassQuestionID;
  String get currentDateTime => _currentDateTime;
  // String get _userID => userID;
  Stream<List<DASSQuestion>> get data => firestoreService.getData();

  //Setter
  set changeStress(int stress) {
    _stress = stress;
    notifyListeners();
  }

  set changeStressDesc(String stressDesc) {
    _stressDesc = stressDesc;
    notifyListeners();
  }

  set changeAnxiety(int anxiety) {
    _anxiety = anxiety;
    notifyListeners();
  }

  set changeAnxietyDesc(String anxietyDesc) {
    _anxietyDesc = anxietyDesc;
    notifyListeners();
  }

  set changeDepression(int depression) {
    _depression = depression;
    notifyListeners();
  }

  set changeDepressionDesc(String depreDesc) {
    _depreDesc = depreDesc;
    notifyListeners();
  }

  //Function
  //Insert all data into database
  loadAll(DASSQuestion data) {
    if (data != null) {
      _dassQuestionID = data.dassQuestionID;
      userID = data.userID;
      _stress = data.stress;
      _stressDesc = data.stressDesc;
      _anxiety = data.anxiety;
      _anxietyDesc = data.anxietyDesc;
      _depression = data.depression;
      _depreDesc = data.depreDesc;
      _currentDateTime = data.currentDateTime;
    } else {
      _dassQuestionID = null;
      userID = null;
      _stress = null;
      _stressDesc = null;
      _anxiety = null;
      _anxietyDesc = null;
      _depression = null;
      _depreDesc = null;
      _currentDateTime = null;
    }
  }

  //Saved data
  // empty daaQuestionId
  savedData() {
    if (_dassQuestionID == null) {
      //add
      var newData = DASSQuestion(
        dassQuestionID: uuid.v1(),
        userID: userID,
        stress: _stress,
        stressDesc: _stressDesc,
        anxiety: _anxiety,
        anxietyDesc: _anxietyDesc,
        depression: _depression,
        depreDesc: _depreDesc,
        currentDateTime: _currentDateTime,
      );
      firestoreService.setData(newData);
    } else {
      var updatedData = DASSQuestion(
        dassQuestionID: _dassQuestionID,
        userID: userID,
        stress: _stress,
        stressDesc: _stressDesc,
        anxiety: _anxiety,
        anxietyDesc: _anxietyDesc,
        depression: _depression,
        depreDesc: _depreDesc,
        currentDateTime: _currentDateTime,
      );
      firestoreService.setData(updatedData);
    }
  }

  //edit

  //RemoveUser
  removeData(String dassQuestionID) {
    firestoreService.deleteData(dassQuestionID);
  }
}
