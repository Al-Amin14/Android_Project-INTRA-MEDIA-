import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/chating/pages/chat_with_use.dart';

class ChatHome extends StatefulWidget {
  ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final _firestor = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var snapdata = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();
    var data_stor = snapdata.data()!["chatList"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          'Chat List',
          style: TextStyle(
              fontFamily: 'Schyler',
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 124, 124, 124)),
        ),
      ),
      body: StreamBuilder(
        stream: _firestor
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            return ListView.builder(
                itemCount: (snapshot.data!["chatList"] as dynamic).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromARGB(255, 207, 228, 218)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.co_present_outlined,
                              size: 50,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            StreamBuilder(
                                stream: _firestor
                                    .collection("users")
                                    .doc(snapshot.data!["chatList"][index]
                                        .toString())
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data!.exists) {
                                    return InkWell(
                                      onTap: () {
                                        var keep_data = snapshot.data;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChatUser(
                                                      uid: keep_data!["uid"],
                                                      sellerName: keep_data[
                                                          "username"],
                                                      isalumni:
                                                          keep_data["Alumni"],
                                                    )));
                                      },
                                      child: Container(
                                        width: 200,
                                        child: Text(
                                          snapshot.data!["email"] +
                                              (snapshot.data!["Alumni"] ==
                                                      "ture"
                                                  ? ' (ALUMNI)'
                                                  : ''),
                                          style: const TextStyle(
                                              fontFamily: 'Schyler',
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
