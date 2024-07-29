import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class storing_data_five extends StatefulWidget {
  final email;
  final pass;
  final bio;
  final contact;
  final image;
  const storing_data_five(
      {super.key, this.email, this.pass, this.bio, this.contact, this.image});

  @override
  State<storing_data_five> createState() => _storing_data_fiveState();
}

class _storing_data_fiveState extends State<storing_data_five> {
  final _auth = FirebaseAuth.instance;
  final _firestor = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  convert_imgae_to_url(Uint8List file) async {
    Reference ref =
        _fireStorage.ref().child('sldkf').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    return snap.ref.getDownloadURL();
  }

  stor_my_data_five() async {
    UserCredential cread = await _auth.createUserWithEmailAndPassword(
        email: widget.email.toString(), password: widget.pass.toString());

    String downloadurl = "";

    _firestor.collection('users').doc(_auth.currentUser!.uid).set({
      'email': widget.email.toString(),
      'pass': widget.email.toString(),
      'bio': widget.bio.toString(),
      'contact': widget.contact.toString(),
      'image': downloadurl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          stor_my_data_five();
        },
        child: Text('Hello world', style: TextStyle(fontFamily: 'Schyler')));
  }
}
