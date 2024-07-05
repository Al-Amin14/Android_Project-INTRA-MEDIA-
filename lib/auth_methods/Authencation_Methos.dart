import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/widgets/home_page.dart';

class Authentication_of_apps extends StatefulWidget {
  TextEditingController email_controller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  Authentication_of_apps(
      {super.key,
      required this.email_controller,
      required this.passwordcontroller});

  @override
  State<Authentication_of_apps> createState() => _Authentication_of_appsState();
}

class _Authentication_of_appsState extends State<Authentication_of_apps> {
  bool looding = false;

  Future<void> login() async {
    setState(() {
      looding = true;
    });

    final cred = await widget._auth
        .signInWithEmailAndPassword(
      email: widget.email_controller.text.toString(),
      password: widget.passwordcontroller.text.toString(),
    )
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      setState(() {
        looding = true;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_page_Screen()));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage('Dont have and accound');
      setState(() {
        var looding = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {
        login();
        setState(() {
          widget.email_controller.text = '';
        });
      },
      child: Container(
          width: 200,
          child: Text(
            'Log in',
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          )),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 43, 43, 43),
      ),
    );
  }
}
