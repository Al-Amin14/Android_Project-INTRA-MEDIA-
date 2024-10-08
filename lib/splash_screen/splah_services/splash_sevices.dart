<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:5034d39a144b724c507cac9604356eefe07f65d6f8645081f5c056a1bac2fff1
size 959
=======
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/login_screen/alumnai_or_student.dart';
import 'package:intra_media/login_screen/login_screen.dart';
import 'package:intra_media/login_screen/sign_up_alumnai.dart';
import 'package:intra_media/widgets/apphome_page.dart';
import 'package:intra_media/widgets/home_page.dart';

class splash_services {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_page_Screen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Longin_screen()));
      });
    }
  }
}
>>>>>>> master
