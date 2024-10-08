<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:0eb54bfbbb7fb95aaaec200cbd5a0ff25f78b3f70030e41b158fa577dc293840
size 2310
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/widgets/profile.dart';

class Follow_button extends StatefulWidget {
  Color background_Color;
  Color border_Color;
  final txt;
  final uid;
  var isfollowig;
  Follow_button({
    super.key,
    required this.txt,
    required this.uid,
    required this.border_Color,
    required this.background_Color,
    required this.isfollowig,
  });

  @override
  State<Follow_button> createState() => _Follow_buttonState();
}

class _Follow_buttonState extends State<Follow_button> {
  final FirebaseFirestore _fireStor = FirebaseFirestore.instance;

  final FirebaseAuth cru = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Container(
      padding: EdgeInsets.all(20),
      child: TextButton(
        onPressed: () {
          if (widget.txt != 'Edit Profile' && widget.txt == 'Follow') {
            _fireStor.collection('users').doc(widget.uid).update({
              'following': FieldValue.arrayUnion([cru.currentUser!.uid])
            });
            setState(() {
              widget.isfollowig = true;
            });
          } else if (widget.txt == 'Following') {
            _fireStor.collection('users').doc(widget.uid).update({
              'following': FieldValue.arrayRemove([cru.currentUser!.uid])
            });
            setState(() {
              widget.isfollowig = false;
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: height * 0.05,
          width: width * 0.5,
          decoration: BoxDecoration(
            color: widget.background_Color,
            border: Border.all(
              color: widget.border_Color,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text(
            widget.txt,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );  
  }
}
>>>>>>> master
