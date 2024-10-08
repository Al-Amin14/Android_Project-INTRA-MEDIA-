import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/following_button.dart';
import 'package:intra_media/chating/pages/chat_home.dart';
import 'package:intra_media/login_screen/login_screen.dart';
import 'package:intra_media/widgets/profile_to_post.dart';

class Myprofile extends StatefulWidget {
  final uid;
  const Myprofile({super.key, required this.uid});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

final FirebaseFirestore _fireStor = FirebaseFirestore.instance;
final FirebaseAuth cru = FirebaseAuth.instance;

class _MyprofileState extends State<Myprofile> {
  var isfollowing = false;
  var follower = 0;
  var following = 0;
  var postlen = 0;
  var collect_data = false;
  var userData;

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
          .where('uid', isEqualTo: widget.uid)
          .get();
      postlen = postSnap.docs.length;
      userData = snapdata.data();
      setState(() {
        follower = userData['followers'].length;
        following = userData['following'].length;
        isfollowing = userData['followers']
            .contains(FirebaseAuth.instance.currentUser!.uid);
      });
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
    setState(() {
      collect_data = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return collect_data == false
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              actions: [
                if (widget.uid == FirebaseAuth.instance.currentUser!.uid)
                  InkWell(
                    onTap: () {
                      Utils().SignOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Longin_screen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FaIcon(
                        FontAwesomeIcons.signOut,
                        color: Colors.white,
                        size: 37.2,
                      ),
                    ),
                  )
              ],
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
                            buildStatColumn(following, 'Following'),
                            buildStatColumn(follower, 'Follwoers'),
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
                              uid: widget.uid,
                              isfollowig: isfollowing,
                              txt: 'Edit Profile',
                              border_Color: Colors.white,
                              background_Color: Colors.black,
                            )
                          : isfollowing
                              ? buttton(Colors.blue, Colors.blue, 'Following',
                                  widget.uid, height, width)
                              //   uid: widget.uid,
                              //   txt: 'Following',
                              //   isfollowig: isfollowing,
                              //   border_Color: Colors.blue,
                              //   background_Color: Colors.blue,
                              // )
                              : buttton(Colors.blue, Colors.blue, 'Follow',
                                  widget.uid, height, width),
                      // Follow_button(
                      //     uid: widget.uid,
                      //     txt: 'Follow',
                      //     isfollowig: isfollowing,
                      //     border_Color: Colors.blue,
                      //     background_Color: Colors.blue,
                      //   ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatHome()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 83, 116, 84)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Chat List',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Schyler',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                                itemCount:
                                    (snapshot.data! as dynamic).docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 1.5,
                                  childAspectRatio: 1,
                                ),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot snap =
                                      (snapshot.data! as dynamic).docs[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Profile_Post()));
                                    },
                                    child: Container(
                                      child: Image(
                                        image: NetworkImage(snap['postUrl']),
                                        fit: BoxFit.cover,
                                      ),
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

  Widget buttton(Color background_Color, Color border_Color, String txt,
      var uid, final height, final width) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextButton(
        onPressed: () {
          if (txt != 'Edit Profile' && txt == 'Follow') {
            _fireStor.collection('users').doc(uid).update({
              'followers': FieldValue.arrayUnion([cru.currentUser!.uid])
            });
            setState(() {
              // isfollowing = true;
              checker_details(uid);
            });
          } else if (txt == 'Following') {
            _fireStor.collection('users').doc(uid).update({
              'followers': FieldValue.arrayRemove([cru.currentUser!.uid])
            });
            setState(() {
              checker_details(uid);
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: height * 0.05,
          width: width * 0.5,
          decoration: BoxDecoration(
            color: background_Color,
            border: Border.all(
              color: border_Color,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  checker_details(final uid) async {
    var foll_cnt1 = await _fireStor.collection('users').doc(uid).get();
    setState(() {
      if (isfollowing) {
        isfollowing = false;
        _fireStor.collection('users').doc(cru.currentUser!.uid).update({
          'following': FieldValue.arrayRemove([widget.uid])
        });
      } else {
        isfollowing = true;
        _fireStor.collection('users').doc(cru.currentUser!.uid).update({
          'following': FieldValue.arrayUnion([widget.uid])
        });
      }
      var foll_cnt2 = foll_cnt1.data()!['followers'].length;
      follower = foll_cnt2;
    });
  }
}
