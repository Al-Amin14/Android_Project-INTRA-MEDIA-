<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:899323b20f1652f905b83574c2f65fedc0608c62fc22405d9e0d49ff40ca5e29
size 1194
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User__ {
  final String email;
  final String uid;
  final String username;
  final String bio;
  final String PhotoUrl;
  final List followers;
  final List following;
  User__({
    required this.email,
    required this.uid,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
    required this.PhotoUrl,
  });
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "followers": followers,
        "following": following,
        "PhotoUrl": PhotoUrl,
      };
  static User__ fromSnap(DocumentSnapshot snap) {
    print("skdlsjldfksdkfjslf");
    print(snap);
    var snapshot = snap.data() as Map<String, dynamic>;
    return User__(
      email: snapshot['email'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      PhotoUrl: snapshot['PhotoUrl'],
    );
  }
}
>>>>>>> master
