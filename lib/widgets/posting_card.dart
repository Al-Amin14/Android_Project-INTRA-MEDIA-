import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/auth_methods/Auth_methods_fire_post_storing.dart';
import 'package:intra_media/widgets/Like_animation.dart';
import 'package:intra_media/widgets/comment_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class Post_card_ui extends StatefulWidget {
  final snap;
  const Post_card_ui({super.key, required this.snap});

  @override
  State<Post_card_ui> createState() => _Post_card_uiState();
}

class _Post_card_uiState extends State<Post_card_ui> {
  final crud = FirebaseAuth.instance;
  var isLikeAnimating = false;
  var count_comment = 0;

  initState() {
    super.initState();
    print('_________________------------------____________________');
    counting_comment();
  }

  counting_comment() async {
    await working_done();
  }

  working_done() async {
    final snap = await FirebaseFirestore.instance
        .collection('post')
        .doc(widget.snap['postId'])
        .collection('comments')
        .get();
    setState(() {
      count_comment = snap.docs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mobileBackgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.004,
              color: const Color.fromARGB(255, 123, 155, 181),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    height: height * 0.09,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(widget.snap['profImage']))),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.snap['username']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Schyler',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  crud.currentUser!.uid==widget.snap["uid"]?
                  IconButton(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: ListView(
                                      shrinkWrap: true,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      children: [
                                        'Delete',
                                      ]
                                          .map(
                                            (e) => InkWell(
                                              onTap: () async {
                                                firebase_storing_data()
                                                    .deletingPost(
                                                        widget.snap['postId']);
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 12),
                                                child: Text(e),
                                              ),
                                            ),
                                          )
                                          .toList()),
                                ));
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )):Container(),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 10),
                  child: Container(
                    height: height * 0.4,
                    width: width * 0.005,
                    color: Color.fromARGB(255, 144, 132, 132),
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    firebase_storing_data().likepost(widget.snap['postId'],
                        crud.currentUser!.uid.toString(), widget.snap['likes']);
                    setState(() {
                      isLikeAnimating = true;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.4,
                        width: width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.network(widget.snap['postUrl'],
                              fit: BoxFit.cover),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isLikeAnimating ? 1 : 0,
                        child: LikeAnimation(
                          child: Icon(
                            Icons.favorite,
                            color: widget.snap['likes']
                                    .contains(crud.currentUser!.uid)
                                ? Colors.red
                                : Colors.white,
                            size: 100,
                          ),
                          isanimating: isLikeAnimating,
                          duration: Duration(
                            milliseconds: 400,
                          ),
                          onEnd: () {
                            setState(() {
                              isLikeAnimating = false;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                children: [
                  LikeAnimation(
                    isanimating: isLikeAnimating,
                    smallLike: true,
                    child: IconButton(
                        onPressed: () {
                          print(
                              '-------------------_______________________${widget.snap['likes'].contains(crud.currentUser!.uid)}_____________________--------------------');
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: widget.snap['likes']
                                  .contains(crud.currentUser!.uid)
                              ? Colors.red
                              : Color.fromARGB(255, 255, 255, 255),
                          size: 30,
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Comments_Screen(
                                      snap: widget.snap,
                                    )));
                      },
                      icon: Icon(
                        Icons.comment_outlined,
                        size: 30,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () async {
                        final uri = Uri.parse(widget.snap['postUrl']);
                        final res = await http.get(uri);
                        Share.shareXFiles([
                          XFile.fromData(
                            res.bodyBytes,
                            name:'posts',
                            mimeType: 'image/png',
                          )
                        ],
                          subject: widget.snap['description'],
                          text: widget.snap['description'],
                        );
                      },
                      icon: Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.white,
                      )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        )),
                  ))
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 30),
                        child: DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                          child: Text(
                            '${widget.snap['likes'].length} likes',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 133, 129, 129)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 30.0),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '${widget.snap['username']} : ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: ' ${widget.snap['description']}',
                              style: TextStyle(fontFamily: 'Schyler'))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Comments_Screen(
                                          snap: widget.snap,
                                        )));
                          },
                          child: Container(
                              child: Text(
                            'View all ${count_comment} comments',
                            style: TextStyle(
                                fontFamily: 'Schyler',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 149, 149)),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: InkWell(
                          child: Container(
                              child: Text(
                            '${widget.snap['dateTimeNow']}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 96, 87, 87)),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
