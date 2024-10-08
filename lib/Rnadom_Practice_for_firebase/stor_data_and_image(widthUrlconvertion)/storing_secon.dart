import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class storing_second extends StatefulWidget {
  final pass;
  final email;
  final bio;
  final contact;
  final Image;
  const storing_second(
      {super.key, this.pass, this.email, this.bio, this.contact, this.Image});

  @override
  State<storing_second> createState() => _storing_secondState();
}

class _storing_secondState extends State<storing_second> {
  final _auth = FirebaseAuth.instance;
  final _firesotr = FirebaseFirestore.instance;
  final _storing = FirebaseStorage.instance;
  Future<String> converting_tost(
      String child, Uint8List file, bool ispost) async {
    Reference ref = _storing.ref().child(child).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    return snap.ref.getDownloadURL();
  }
  
  stor_my_data() async {
    UserCredential cread = await _auth.createUserWithEmailAndPassword(
        email: widget.pass.toString(), password: widget.pass.toString());
    final ss = converting_tost('Prac', widget.Image, false);
    _firesotr.collection('Users').doc(_auth.currentUser!.uid).set({
      'email':widget.email.toString(),
      'pass':widget.pass.text.toString(),
      'bio':widget.bio.text.toString(),
      'contact':widget.contact.text.toString(),
      'image':ss,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          stor_my_data();
        },
        child: Text(
          'Hello world',
          style: TextStyle(fontFamily: 'Schyler', color: Colors.greenAccent),
        ),
      ),
    );
  }
}
