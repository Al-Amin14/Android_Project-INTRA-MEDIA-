<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:340dcde4e3438293dc42df11e54255a305fccbaa6e5ad3ceffee5e60380701f8
size 2715
=======
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Sotoring_first_data extends StatefulWidget {
  final pass;
  final email;
  final bio;
  final contact;
  final image;
  const Sotoring_first_data(
      {super.key, this.pass, this.email, this.bio, this.contact, this.image});

  @override
  State<Sotoring_first_data> createState() => _Sotoring_first_dataState();
}

class _Sotoring_first_dataState extends State<Sotoring_first_data> {
  final _firesauth = FirebaseAuth.instance;
  final _firstor = FirebaseFirestore.instance;
  final stor = FirebaseStorage.instance;

  // Future<String> uploadImageto_Storage(
  //     String childName, Uint8List file, bool ispost) async {
  //   Reference ref =
  //       _storage.ref().child(childName).child(_auth.currentUser!.uid);

  //   if (ispost) {
  //     String id = Uuid().v1();
  //     ref = ref.child(id);
  //   }

  //   UploadTask uploadTask = ref.putData(file);

  //   TaskSnapshot snap = await uploadTask;
  //   String downurl = await snap.ref.getDownloadURL();
  //   return downurl;
  // }


  Future<String> uploadImageto_Storage(
      String chilname, Uint8List file, bool ispost) async {
    Reference ref =
        stor.ref().child(chilname).child(_firesauth.currentUser!.uid);
    UploadTask uploadtask = ref.putData(file);

    if (ispost) {
      String id = Uuid().v1();
      ref = ref.child(id);
    }
    
    TaskSnapshot snap = await uploadtask;
    String downurl = await snap.ref.getDownloadURL();
    return downurl;
  }

  first_stor_data() async {
    UserCredential cread = await _firesauth.createUserWithEmailAndPassword(
        email: widget.email.text.toString(),
        password: widget.pass.text.toSting());

    String ss = await uploadImageto_Storage('data_st', widget.image, true);

    _firstor.collection('users').doc(cread.user!.uid).set({
      'pass': widget.pass.text.toString(),
      'email': widget.email.text.toString(),
      'bio': widget.bio.text.toString(),
      'contact': widget.contact.text.toString(),
      'ProfImage':ss,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          first_stor_data();
        },
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
>>>>>>> master
