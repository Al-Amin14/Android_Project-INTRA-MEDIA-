import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/Widget_ForGloblaUse/text_form_filed.dart';
import 'package:intra_media/chating/pages/chat_home.dart';
import 'package:intra_media/chating/services/chat_services.dart';

class ChatUser extends StatelessWidget {
  String uid;
  String sellerName;
  final _messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _chatservices = ChatServices();
  String isalumni;
  ChatUser({super.key, required this.uid, required this.sellerName,this.isalumni="false"});

  void sendmessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatservices.sendMessage(uid, sellerName, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Text(
            'Chat with ${sellerName.toString()}'+(isalumni=="ture"?'(Alumni)':''),
            style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatHome()));
                },
                icon: const Icon(
                  Icons.list,
                  size: 50,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(child: _buildMessageList()),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildUserInput(),
            )
          ],
        ));
  }

  Widget _buildMessageList() {
    String senderId = _auth.currentUser!.uid;
    return StreamBuilder(
        stream: _chatservices.getMessage(senderId, uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Text("Error");
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(
              child: Text("Loading...."),
            );
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItems(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItems(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    var aligning = _auth.currentUser!.uid == data["senderId"] ? true : false;

    return Column(
        crossAxisAlignment:
            aligning ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: aligning
                        ? Color.fromARGB(255, 40, 101, 53)
                        : Color.fromARGB(255, 92, 89, 89)),
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data["message"].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Schyler',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              '${aligning ? "by you" : "by ${sellerName}"}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: Text_form_fields(
                storingdata: _messageController,
                hint_text_provide: "Type a message",
                icons_provide: Icon(
                  Icons.message,
                  size: 30,
                ))),
        IconButton(
            onPressed: sendmessage,
            icon: Icon(
              Icons.arrow_upward,
              size: 40,
            )),
      ],
    );
  }
}
