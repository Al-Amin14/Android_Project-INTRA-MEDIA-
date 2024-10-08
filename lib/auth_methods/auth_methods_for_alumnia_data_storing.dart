<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:9f52e7081efdf015763db8be0b7d671b6e71f116fbba530ee24b97f2788b8981
size 4459
=======
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intra_media/Utils/alumni_data_in_firebase.dart';
import 'package:intra_media/Utils/user_details_for_post.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/auth_methods/storing_data_on_firebase.dart';

class singUP_for_Alumni extends StatefulWidget {
  TextEditingController emial_alm = TextEditingController();
  TextEditingController pass_alm = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController jobdetails = TextEditingController();
  TextEditingController linkIDin = TextEditingController();
  TextEditingController Batch = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController Contactemail = TextEditingController();
  TextEditingController github = TextEditingController();
  Uint8List? file;
  singUP_for_Alumni(
      {super.key,
      required this.emial_alm,
      required this.pass_alm,
      required this.department,
      required this.bio,
      required this.jobdetails,
      required this.linkIDin,
      required this.github,
      required this.Batch,
      required this.fullname,
      required this.Contactemail,
      required this.file});

  @override
  State<singUP_for_Alumni> createState() => _singUP_for_AlumniState();
}

class _singUP_for_AlumniState extends State<singUP_for_Alumni> {
  var res = "Singned UP";
  final _auth = FirebaseAuth.instance;
  final _fireStor = FirebaseFirestore.instance;
  var looding = false;
  void singup() async {
    try {
      UserCredential cread = await _auth.createUserWithEmailAndPassword(
          email: widget.emial_alm.text.toString(),
          password: widget.pass_alm.text.toString());
      String photoUrl = await storage_methods_auth()
          .uploadImageto_Storage('ProfilesPices', widget.file!, false);

      _fireStor.collection('users').doc(cread.user!.uid).set({
        'Alumni': 'ture',
        'username': widget.emial_alm.text.toString().split('@')[0],
        'email': widget.emial_alm.text.toString(),
        'uid': cread.user!.uid,
        'department': widget.department.text.toString(),
        'bio': widget.bio.text.toString(),
        'PhotoUrl': photoUrl,
        'Contactemail': widget.Contactemail.text.toString(),
        'github': widget.github.text.toString(),
        'fullname': widget.fullname.text.toString(),
        'Batch': widget.Batch.text.toString(),
        'LinkedInId': widget.linkIDin.text.toString(),
        'followers': [],
        'following': [],
        'chatList': [],
        'jobDetails': widget.jobdetails.text.toString(),
      });
      Utils().toastMessage(res);
    } catch (err) {
      setState(() {
        res = "Some Error have occurd";
      });
      Utils().toastMessage(res);
    }
    setState(() {
      looding = false;
      widget.bio.text = '';
      widget.pass_alm.text = '';
      widget.emial_alm.text = '';
      widget.jobdetails.text = '';
      widget.department.text = '';
      widget.Batch.text = '';
      widget.Contactemail.text = '';
      widget.fullname.text = '';
      widget.github.text = '';
      widget.linkIDin.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            looding = true;
          });
          singup();
        },
        child: Container(
          width: 200,
          child: looding == false
              ? Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 43, 43, 43),
        ));
  }
}
>>>>>>> master
