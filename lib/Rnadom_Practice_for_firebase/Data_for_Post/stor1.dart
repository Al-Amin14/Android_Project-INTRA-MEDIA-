import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/Rnadom_Practice_for_firebase/Data_for_Post/post1.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:uuid/uuid.dart';

class Storing1 {
  final _auth = FirebaseAuth.instance;
  final _firestor = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;

  converting(Uint8List file) async {
    Reference ref =
        _firestorage.ref().child("Post").child(_auth.currentUser!.uid);
    UploadTask uploadtask = ref.putData(file);
    TaskSnapshot snap = await uploadtask;
    return snap.ref.getDownloadURL();
  }

  Future<String> stordataofpost(
      final String disctiption,
      final String uids,
      final String username,
      final String PostId,
      Uint8List? file,
      final String postUrl) async {
    try {
      String ss = converting(file!);
      final datatime = DateFormat.yMMMMd().format(DateTime.now());
      String uuid = Uuid().v1();

      Post1 post = Post1(uids, username, uuid, ss, [], datatime, disctiption);
      _firestor
          .collection('post')
          .doc(uuid)
          .set(post.toJson());
    } catch (err){
      Utils().toastMessage(err.toString());
    }

    return "sdsd";
  }
}
