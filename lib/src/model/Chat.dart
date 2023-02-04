class Chat {
  String message, chatID, sendBy, senderName, role, timeMessage;

  Chat({
    this.chatID,
    this.message,
    this.sendBy,
    this.senderName,
    this.role,
    this.timeMessage,
  });

//Create Json into FireStore
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatID: json['chatID'],
      message: json['message'],
      sendBy: json['sendBy'],
      senderName: json['senderName'],
      role: json['role'],
      timeMessage: json['timeMessage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatID': chatID,
      'message': message,
      'sendBy': sendBy,
      'senderName': senderName,
      'role': role,
      'timeMessage': timeMessage,
    };
  }
}
