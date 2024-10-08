import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final String postUrl;
  final String profImage;
  final String dateTimeNow;
  final likes;
  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.postUrl,
    required this.profImage,
    required this.likes,
    required this.dateTimeNow,
  });
  Map<String, dynamic> toJson() => {    
        "description": description,
        "uid": uid,
        "username": username,
        "postId": postId,
        "postUrl": postUrl,
        "profImage": profImage,
        "likes": likes,
        "dateTimeNow":dateTimeNow,
    };
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
      dateTimeNow: snapshot['dateTimeNow'],
    );
  }
}
