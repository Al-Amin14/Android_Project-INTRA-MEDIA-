<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:59be748dec93824bbcdaed1c4a2736f23b7b484f83063f4e7c134a6984f1a393
size 1622
=======
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intra_media/Utils/user_details_for_post.dart';

class alumni_data_firebase {
  final String email_alumni;
  final String uid;
  final String department_alumni;
  final String linkedinId_alumni;
  final String jobdetails_alumni;
  final String bio_alumni;
  final String image_alumni;
  alumni_data_firebase({
    required this.email_alumni,
    required this.department_alumni,
    required this.linkedinId_alumni,
    required this.jobdetails_alumni,
    required this.bio_alumni,
    required this.uid,
    required this.image_alumni,
  });
  Map<String, dynamic> toJson() => {
        "email": email_alumni,
        "department": department_alumni,
        "uid": uid,
        "linkedinId": linkedinId_alumni,
        "jobdetails": jobdetails_alumni,
        "bio_alumni": bio_alumni,
        'followers': [],
        'following': [],
        "image": image_alumni,
      };
  static alumni_data_firebase fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String,dynamic>;
    return alumni_data_firebase(
      email_alumni: snapshot['email'],
      department_alumni: snapshot['department'],
      linkedinId_alumni:snapshot['linkedinId'],
      uid:snapshot['uid'],
      jobdetails_alumni: snapshot['jobdetails'],
      bio_alumni: snapshot['bio_alumni'],
      image_alumni: snapshot['image_alumni'],
    );
  }
}
>>>>>>> master
