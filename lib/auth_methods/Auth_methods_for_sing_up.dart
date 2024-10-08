import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/auth_methods/storing_data_on_firebase.dart';

class auth_method_signupu extends StatefulWidget {
  TextEditingController emailing = TextEditingController();
  TextEditingController passwording = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController semester = TextEditingController();
  TextEditingController bio = TextEditingController();
  Uint8List? file;
  auth_method_signupu({
    super.key,
    required this.emailing,
    required this.passwording,
    required this.department,
    required this.semester,
    required this.bio,
    required this.file,
  });

  @override
  State<auth_method_signupu> createState() => _auth_method_signupuState();
}

class _auth_method_signupuState extends State<auth_method_signupu> {
  bool looding = false;
  final _auth = FirebaseAuth.instance;
  final _firestor = FirebaseFirestore.instance;

  void signup() async {
    try {
      UserCredential cread = await _auth.createUserWithEmailAndPassword(
          email: widget.emailing.text.toString(),
          password: widget.passwording.text.toString());
      //     .then(
      //   (value) {
      //     Utils().toastMessage("Singedup");
      //   },
      // ).onError((error, stackTrace) async {
      //   debugPrint(error.toString());
      //   Utils().toastMessage(error.toString());
      // });  
      String photoUrl = await storage_methods_auth()
          .uploadImageto_Storage('ProfilesPics', widget.file!, false);
      _firestor.collection('users').doc(cread.user!.uid).set({
        'Alumni':'false',
        'username': widget.emailing.text.toString().split('@')[0],
        'email': widget.emailing.text.toString(),
        'uid': cread.user!.uid,
        'department': widget.department.text.toString(),
        'semster': widget.semester.text.toString(),
        'bio': widget.bio.text.toString(),
        'followers': [],
        'following': [],
        'chatList':[],
        'PhotoUrl':photoUrl,
      });
      Utils().toastMessage('Singed Up');
    } catch (err) {
      Utils().toastMessage(err.toString());
    }
    setState(() {
      looding = false;
      widget.emailing.text = '';
      widget.passwording.text = '';
      widget.bio.text = '';
      widget.semester.text = '';
      widget.department.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            looding = true;
          });
          signup();
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
