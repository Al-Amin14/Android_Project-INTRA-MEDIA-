<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:89256d67f94e01af380ec08d8fc344f8202e205161718a1f753c4f9327f863ba
size 4048
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/user_details.dart';
import 'package:intra_media/Widget_ForGloblaUse/text_form_filed.dart';
import 'package:intra_media/auth_methods/Auth_methods_fire_post_storing.dart';
import 'package:intra_media/prividers/user_providers.dart';
import 'package:intra_media/widgets/apphome_page.dart';
import 'package:provider/provider.dart';

import 'Comment_cart.dart';

class Comments_Screen extends StatefulWidget {
  final snap;
  const Comments_Screen({super.key, required this.snap});

  @override
  State<Comments_Screen> createState() => _Comments_ScreenState();
}

class _Comments_ScreenState extends State<Comments_Screen> {
  TextEditingController _comment_on_post = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final User__ user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Myapp_home_page()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text('Comments',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('post')
              .doc(widget.snap['postId'])
              .collection('comments')
              .orderBy('datePublish', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) =>
                      // Container(child: Text('asldkfjalksdjflk'),),
                      Comment_card_for_comments(
                        snap: (snapshot.data! as dynamic).docs[index].data(),
                      ));
            }
          }),
      bottomNavigationBar: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                user.PhotoUrl,
              ),
            ),
          ),
          Expanded(
              child: Text_form_fields(
                  storingdata: _comment_on_post,
                  hint_text_provide: 'Enter you comments...',
                  icons_provide: const Icon(
                    Icons.line_weight_sharp,
                    size: 20,
                    color: Colors.white,
                  ),
                  Color: Colors.white)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: InkWell(
              onTap: () async {
                await firebase_storing_data().postComment(
                    widget.snap['postId'],
                    _comment_on_post.text.toString(),
                    user.uid,
                    user.username,
                    user.PhotoUrl);
              },
              child: Text(
                'Post',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 49, 114, 53)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
>>>>>>> master
