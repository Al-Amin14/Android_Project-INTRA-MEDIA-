import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/user_details.dart';
import 'package:intra_media/prividers/user_providers.dart';
import 'package:provider/provider.dart';

class Comment_card_for_comments extends StatefulWidget {
  final snap;
  const Comment_card_for_comments({super.key, required this.snap});

  @override
  State<Comment_card_for_comments> createState() =>
      _Comment_card_for_commentsState();
}

class _Comment_card_for_commentsState extends State<Comment_card_for_comments> {
  void initState() {
    super.initState();
    print(widget.snap);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              widget.snap["profilePic"],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '${widget.snap["name"]} : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 103, 102, 102))),
              TextSpan(
                  text: widget.snap['comment_text'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              TextSpan(
                  text: '\n${widget.snap['datePublish']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 103, 102, 102))),
            ])),
          ),
        ),
      ],
    );
  }
}
