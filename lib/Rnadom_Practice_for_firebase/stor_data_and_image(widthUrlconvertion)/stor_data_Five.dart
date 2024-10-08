import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class sotringdatafive extends StatefulWidget {
  final email;
  final pass;
  final image;
  final bio;
  final contact;
  const sotringdatafive(
      {super.key, this.email, this.pass, this.image, this.bio, this.contact});

  @override
  State<sotringdatafive> createState() => _sotringdatafiveState();
}

class _sotringdatafiveState extends State<sotringdatafive> {
  final _auth = FirebaseAuth.instance;
  final _fir_stor = FirebaseFirestore.instance;
  final _fir_Storage = FirebaseStorage.instance;
  converting(Uint8List file) async {
    Reference ref =
        _fir_Storage.ref().child('Post').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    return snap.ref.getDownloadURL();
  }

  stor_my_data_five() async {
    UserCredential cread = await _auth.createUserWithEmailAndPassword(
        email: widget.email.toString(), password: widget.pass.toString());

    String ss = converting(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          stor_my_data_five();
        },
        child: Text(
          'Hello wordl',
          style: TextStyle(fontFamily: 'Schyler'),
        ));
  }
}
