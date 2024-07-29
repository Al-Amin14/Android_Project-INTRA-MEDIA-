import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/Rnadom_Practice_for_firebase/Data_for_Post/post2.dart';
import 'package:intra_media/Utils/user_details_for_post.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:uuid/uuid.dart';

class Stor2 {
  final _auth = FirebaseAuth.instance;
  final _firestor = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  converting(Uint8List file) async {
    Reference ref =
        _fireStorage.ref().child('post').child(_auth.currentUser!.uid);
    UploadTask uploadtask = ref.putData(file);
    TaskSnapshot snap = await uploadtask;
    return snap.ref.getDownloadURL();
  }

  Future<String> PostStor(
      final String disctiption,
      final String uids,
      final String username,
      final String PostId,
      Uint8List? file,
      final String postUrl) async {
    try {
      String ss = converting(file!);
      final datetime = DateFormat.yMMMd().format(DateTime.now());
      String PostID = Uuid().v1();
      Post2 post = Post2(disctiption, uids, username, PostID, ss, [], datetime);
      _firestor.collection('Post').doc(PostID).set(post.toJsson());
    } catch (err) {
      Utils().toastMessage(err.toString());
    }
    return "-----";
  }
}
