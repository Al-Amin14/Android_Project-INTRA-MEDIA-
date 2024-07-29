import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/Rnadom_Practice_for_firebase/Data_for_Post/post3.dart';
import 'package:intra_media/Utils/user_details_for_post.dart';
import 'package:uuid/uuid.dart';

class Stor3 {
  final _auth = FirebaseAuth.instance;
  final _frst = FirebaseFirestore.instance;
  final _frStorage = FirebaseStorage.instance;
  convert_url(Uint8List file) async {}

  Future<String> storingdata(
      final String disctiption,
      final String uids,
      final String username,
      final String PostId,
      Uint8List? file,
      final String postUrl) async {
    String ss = convert_url(file!);
    String PostID = Uuid().v1();
    final datetime = DateFormat.yMMMMd().format(DateTime.now());
    Post3 post = Post3(disctiption, uids, username, PostID, ss, [], datetime);
    _frst.collection('Post').doc(PostID).set(post.toJson());
    return "";
  }
}