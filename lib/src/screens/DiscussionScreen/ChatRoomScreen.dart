import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindcomposure/src/model/Chat.dart';
import 'package:mindcomposure/src/provider/ChatProvider.dart';
import 'package:provider/provider.dart';

class ChatRoomScreen extends StatefulWidget {
  final String senderID, name, role;
  ChatRoomScreen(this.senderID, this.name, this.role);
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  TextEditingController messageTextEditingController = TextEditingController();
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 233, 242, 235),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 61, 122, 135),
        title: Center(
          child: Text(
            " Community Talk ",
            style: GoogleFonts.courgette(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Container(
          child: Stack(
        children: [
          chatMessage(),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.black.withOpacity(0.8),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: messageTextEditingController,
                      onChanged: (value) {
                        setState(() {
                          _msg = value.trim();
                          print('Try message:  $_msg');
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message",
                          hintStyle: TextStyle(color: Colors.white)),
                    )),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          print('Try message:  $_msg');
                          addMessage(_msg);
                          messageTextEditingController.clear();
                        });
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      )),
    );
  }

  addMessage(String _msg) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = auth.currentUser;
    String _message = _msg;

    DateTime lastMessage = DateTime.now();
    String convertedDateTime =
        "${lastMessage.year.toString()}-${lastMessage.month.toString().padLeft(2, '0')}-${lastMessage.day.toString().padLeft(2, '0')}    ${lastMessage.hour.toString()}:${lastMessage.minute.toString()}";

    var _chat = Chat(
      message: _message,
      timeMessage: convertedDateTime,
      sendBy: userCredential.uid,
      senderName: widget.name,
      role: widget.role,
    );
    chatProvider.loadAll(_chat);
    chatProvider.savedChat();
  }

  Widget chatMessageTile(
      String message, String time, String name, String role, bool sendByMe) {
    return Row(
      mainAxisAlignment:
          sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight:
                      sendByMe ? Radius.circular(0) : Radius.circular(24),
                  topRight: Radius.circular(20),
                  bottomLeft:
                      sendByMe ? Radius.circular(20) : Radius.circular(0),
                ),
                color: sendByMe
                    ? Color.fromARGB(250, 61, 122, 135)
                    : Color.fromARGB(250, 218, 200, 182),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  !sendByMe
                      ? Text(
                          name + " (" + role + ")",
                          style: GoogleFonts.workSans(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SizedBox(),
                  Container(
                    child: Text(
                      message,
                      style: GoogleFonts.workSans(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "DateTime:" + time.toString(),
                    style: GoogleFonts.workSans(
                      fontSize: 7,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget chatMessage() {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Chat')
            .orderBy('timeMessage', descending: true)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data.docs;
          print('DOCS  ${documents.length}');
          return ListView.builder(
              reverse: true,
              padding: EdgeInsets.only(bottom: 80, top: 16),
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return chatMessageTile(
                  documents[index].get('message'),
                  documents[index].get('timeMessage'),
                  documents[index].get('senderName'),
                  documents[index].get('role'),
                  widget.senderID == documents[index].get('sendBy'),
                );
              });
        });
  }
  // }
}
