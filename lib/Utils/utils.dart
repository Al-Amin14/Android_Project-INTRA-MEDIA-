import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';

final styling1 =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Schyler');

class Utils {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool looding = false;
  pickImgae(ImageSource source) async {
    final ImagePicker _imgePicker = ImagePicker();
    XFile? _file = await _imgePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    Utils().toastMessage('No Image selectedd');
  }

  void queries_of_app(context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> SignOut() async {
    await _auth.signOut();
  }

  // Share_data(String url, String discription) async {
  //   // Share_data();
  //   final uri = Uri.parse(url);
  //   final res = await http.get(uri);
  //   final bytes = res.bodyBytes;

  //   final temp = await getTemporaryDirectory();
  //   final path = '${temp.path}/image.jpg';
  //   File(path).writeAsBytesSync(bytes);
  //   await Share.share('$path,$discription');
  // }
}
