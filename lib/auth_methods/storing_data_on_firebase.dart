import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intra_media/Utils/user_details.dart' as model;
import 'package:uuid/uuid.dart';

class storage_methods_auth {
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User__> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    print(
        ")))))))))))))))))))))))))))))))(((((((((((((())))))))))))))\n${snap.data()}");
    return model.User__.fromSnap(snap);
  }

  Future<String> uploadImageto_Storage(
      String childName, Uint8List file, bool ispost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    if (ispost) {
      String id = Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downurl = await snap.ref.getDownloadURL();

    return downurl;
  }
}
