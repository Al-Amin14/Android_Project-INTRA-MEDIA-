<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:24a6554b10f0f5737bd242c74e630a5e6d54262e355e6d79a8e0f5d951314a52
size 606
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intra_media/Utils/user_details.dart';
import 'package:intra_media/auth_methods/storing_data_on_firebase.dart';

class UserProvider with ChangeNotifier {
  User__? _user;
  final storage_methods_auth _authMethods = storage_methods_auth();

  User__ get getUser => _user!;
  Future<void> refersUser() async {
    User__ user = (await _authMethods.getUserDetails()) as User__;
    _user = user;
    // print("---__________________");
    // print(_user);
    notifyListeners();
  }
}
>>>>>>> master
