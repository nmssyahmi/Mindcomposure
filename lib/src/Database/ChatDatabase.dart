import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcomposure/src/model/Chat.dart';

class ChatDatabase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //read
  Stream<List<Chat>> getChat() {
    return _db.collection('Chat').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Chat.fromJson(doc.data())).toList());
  }
  //insert and Update

  Future<Chat> fetchChat(String chatID) {
    return _db
        .collection('DASSQuestion')
        .doc(chatID)
        .get()
        .then((snapshot) => Chat.fromJson(snapshot.data()));
  }

  Future<void> setChat(Chat chat) {
    var options = SetOptions(merge: true);
    return _db.collection('Chat').doc(chat.chatID).set(chat.toMap(), options);
  }

  //delete
  Future<void> deleteChat(String chatID) {
    return _db.collection('Chat').doc(chatID).delete();
  }
}
