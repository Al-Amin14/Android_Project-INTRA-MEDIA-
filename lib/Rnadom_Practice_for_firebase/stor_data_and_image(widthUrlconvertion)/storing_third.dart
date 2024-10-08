import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class storing_third extends StatefulWidget {
  final pass;
  final email;
  final bio;
  final contact;
  final image;
  const storing_third(
      {super.key, this.pass, this.email, this.bio, this.contact, this.image});

  @override
  State<storing_third> createState() => _storing_thirdState();
}

class _storing_thirdState extends State<storing_third> {
  final _auth = FirebaseAuth.instance;
  final _fst = FirebaseFirestore.instance;
  final _storing = FirebaseStorage.instance;
  convert_to_str(Uint8List file) async {
    Reference ref =
        _storing.ref().child('post').child(_auth.currentUser!.uid);
    UploadTask up = ref.putData(file);
    TaskSnapshot snap = await up;
    return snap.ref.getDownloadURL();
  }

  stor_third() async {
    UserCredential cread = await _auth.createUserWithEmailAndPassword(
        email: widget.email.toString(), password: widget.pass.toString());

    String ss = convert_to_str(widget.image);
    _fst.collection('user').doc(_auth.currentUser!.uid).set({
      'email': widget.email.toString(),
      'uid': widget.email.toString(),
      'bio': widget.bio.toString(),
      'contact': widget.contact.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          stor_third();
        },
        child: Text(
          'Hellow world',
          style: TextStyle(color: Colors.pinkAccent),
        ),
      ),
    );
  }
}
