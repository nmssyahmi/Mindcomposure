import 'package:flutter/widgets.dart';
import 'package:mindcomposure/src/Database/ChatDatabase.dart';
import 'package:mindcomposure/src/model/Chat.dart';

import 'package:uuid/uuid.dart';

class ChatProvider with ChangeNotifier {
  final firestoreService = ChatDatabase();
  String _message, _chatID, _sendBy, _senderName, _role, _timeMessage;
  var uuid = Uuid();

  //getter

  String get message => _message;
  String get role => _role;
  String get chatID => _chatID;
  String get senderName => _senderName;
  String get sendBy => _sendBy;
  String get timeMessage => _timeMessage;
  Stream<List<Chat>> get data => firestoreService.getChat();

  //Setter
  set changeMessage(String message) {
    _message = message;
    notifyListeners();
  }

  set changeSendBy(String sendBy) {
    _sendBy = sendBy;
    notifyListeners();
  }

  set changeTimeMessage(String timeMessage) {
    _timeMessage = timeMessage;
    notifyListeners();
  }

  //Function
  //Insert all data into database
  loadAll(Chat chat) {
    if (chat != null) {
      _chatID = chat.chatID;
      _message = chat.message;
      _role = chat.role;
      _senderName = chat.senderName;
      _sendBy = chat.sendBy;
      _timeMessage = chat.timeMessage;
    } else {
      _chatID = null;
      _message = null;
      _role = null;
      _senderName = null;
      _sendBy = null;
      _timeMessage = null;
    }
  }

  //Saved data
  // empty daaQuestionId
  savedChat() {
    if (_chatID == null) {
      //add
      var newChat = Chat(
        chatID: uuid.v1(),
        message: _message,
        role: _role,
        senderName: _senderName,
        sendBy: _sendBy,
        timeMessage: _timeMessage,
      );
      firestoreService.setChat(newChat);
    } else {
      var updatedChat = Chat(
        chatID: _chatID,
        message: _message,
        role: _role,
        senderName: _senderName,
        sendBy: _sendBy,
        timeMessage: _timeMessage,
      );
      firestoreService.setChat(updatedChat);
    }
  }

  //edit

  //RemoveUser
  removeChat(String chatID) {
    firestoreService.deleteChat(chatID);
  }
}
