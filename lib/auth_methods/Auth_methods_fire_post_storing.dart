import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/Utils/user_details_for_post.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/auth_methods/storing_data_on_firebase.dart';
import 'package:uuid/uuid.dart';

class firebase_storing_data {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost_onfirestor(
    String description,
    Uint8List? file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "Some error occured";
    try {
      String photoUrl = await storage_methods_auth()
          .uploadImageto_Storage('Posts', file!, true);

      String date_time_post =
          DateFormat.yMMMd().format(DateTime.now()).toString();

      String postID = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postID,
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
        dateTimeNow: date_time_post,
      );
      await _firestore.collection('post').doc(postID).set(post.toJson());
      res = "Posted";
      Utils().toastMessage(res);
    } catch (err) {
      res = err.toString();
      Utils().toastMessage(res);
    }
    return res;
  }

  Future<void> likepost(String postID, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('post').doc(postID).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('post').doc(postID).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> postComment(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = Uuid().v1();
        await _firestore
            .collection('post')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'commentId': commentId,
          'datePublish': DateFormat.yMMMd().format(DateTime.now()).toString(),
          'comment_text': text,
        });
        Utils().toastMessage('Commented');
      }
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }

  Future<void> deletingPost(String postId) async {
    try {
      _firestore.collection('post').doc(postId).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletingProduct(String ProductId,BuildContext context) async {
    try {
      await _firestore.collection('products').doc(ProductId).delete();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
        child: Text('Some Error have occured',style: TextStyle(fontWeight: FontWeight.bold),),
      )));
    }
  }
}
