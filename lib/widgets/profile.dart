import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/following_button.dart';

class Myprofile extends StatefulWidget {
  final uid;
  const Myprofile({super.key, required this.uid});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  var follower = 0;
  var following = 0;
  var postlen = 0;
  var collect_data = false;
  var userData;
  var isfollowing = false;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var snapdata = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      var postSnap = await FirebaseFirestore.instance
          .collection('post')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      postlen = postSnap.docs.length;
      userData = snapdata.data();
      isfollowing = userData['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      follower = userData['followers'].length;
      following = userData['following'].length;
      setState(() {});
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
    setState(() {
      collect_data = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return collect_data == false
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 45,
                        backgroundImage: NetworkImage(userData['PhotoUrl']),
                      ),
                      Text(
                        userData['username'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildStatColumn(postlen, 'Post'),
                            buildStatColumn(follower, 'Following'),
                            buildStatColumn(following, 'Follwoers'),
                          ],
                        ),
                      ),
                      Text(
                        userData['bio'],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      FirebaseAuth.instance.currentUser!.uid == widget.uid
                          ? Follow_button(
                              txt: 'Edit Profile',
                              border_Color: Colors.white,
                              background_Color: Colors.black,
                            )
                          : isfollowing
                              ? Follow_button(
                                  txt: 'Following',
                                  border_Color: Colors.blue,
                                  background_Color: Colors.blue,
                                )
                              : Follow_button(
                                  txt: 'Follow',
                                  border_Color: Colors.blue,
                                  background_Color: Colors.blue,
                                ),
                      Divider(),
                      FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('post')
                              .where('uid', isEqualTo: widget.uid)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: (snapshot.data! as dynamic).docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing:5,
                                  mainAxisSpacing: 1.5,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot snap =
                                      (snapshot.data! as dynamic).docs[index];
                                  return Container(
                                    child: Image(
                                      image: NetworkImage(snap['postUrl']),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 156, 153, 153)),
        )
      ],
    );
  }
}
