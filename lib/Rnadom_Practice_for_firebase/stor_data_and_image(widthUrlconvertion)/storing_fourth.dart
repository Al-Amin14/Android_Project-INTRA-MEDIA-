import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class storingfourth extends StatefulWidget {
  final pass;
  final email;
  final bio;
  final contact;
  final image;
  const storingfourth(
      {super.key, this.pass, this.email, this.bio, this.contact, this.image});

  @override
  State<storingfourth> createState() => _storingfourthState();
}

class _storingfourthState extends State<storingfourth> {
  final _auth = FirebaseAuth.instance;
  final _fireStor = FirebaseFirestore.instance;
  final fireStorage = FirebaseStorage.instance;
  convet_to_uilst(Uint8List file) async {
    Reference ref =
        fireStorage.ref().child('asdfs').child(_auth.currentUser!.uid);
    UploadTask uloasdtadk = ref.putData(file);
    TaskSnapshot snap = await uloasdtadk;
    return await snap.ref.getDownloadURL();
  }

  Stor_My_data_fourth() async {
    UserCredential cread = await _auth.createUserWithEmailAndPassword(
        email: widget.email.toString(), password: widget.pass.toString());

    String ss = convet_to_uilst(widget.image);

    _fireStor.collection('users').doc(_auth.currentUser!.uid).set({
      'email': widget.email.toString,
      'pass': widget.pass.toString(),
      'bio': widget.bio.toString(),
      'contact': widget.contact.toString(),
      'image': ss,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            Stor_My_data_fourth();
          },
          child: Text('Stor data', style: TextStyle(color: Colors.black))),
    );
  }
}
