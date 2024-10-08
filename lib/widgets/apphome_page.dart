import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/user_details.dart' as model;
import 'package:intra_media/prividers/user_providers.dart';
import 'package:intra_media/widgets/posting_card.dart';
import 'package:provider/provider.dart';

class Myapp_home_page extends StatelessWidget {
      Myapp_home_page({super.key});

  String username = "";

  /*
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   print(snap);

  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)['username'];
  //   });
  // }

  */

  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: mobileBackgroundColor,
          appBar: AppBar(
            backgroundColor: mobileBackgroundColor,
            toolbarHeight: 40,
            centerTitle: true,
            title: Text('INTRA   MEDIA',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Schyler',
                    color: Color.fromARGB(255, 144, 147, 144))),
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('post').snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    height: MediaQuery.sizeOf(context).height*0.74,
                    child: Post_card_ui(
                      snap:snapshot.data!.docs[index].data(),
                    ),
                  ),
                );
              })),
    );
  }
}