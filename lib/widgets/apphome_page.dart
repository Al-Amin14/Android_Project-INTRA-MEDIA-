import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/user_details.dart' as model;
import 'package:intra_media/prividers/user_providers.dart';
import 'package:intra_media/widgets/notes_resource.dart';
import 'package:intra_media/widgets/posting_card.dart';
import 'package:provider/provider.dart';
import 'package:intra_media/Utils/user_details.dart' as model;

class Myapp_home_page extends StatefulWidget {
  const Myapp_home_page({super.key});

  @override
  State<Myapp_home_page> createState() => _Myapp_home_pageState();
}

class _Myapp_home_pageState extends State<Myapp_home_page> {
  String username = "";

  @override
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
    model.User__ userss =
        Provider.of<UserProvider>(context).getUser as model.User__;
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
            title: Text('INTRA MEDIA',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Schyler',
                    color: Color.fromARGB(255, 15, 80, 17))),
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