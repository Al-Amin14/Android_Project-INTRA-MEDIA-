<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:6bf4e9dd895cef835bcc25c184ebba3b98bcebf85a3acdce3c62078468aa73d8
size 1527
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intra_media/chating/model/model.dart';

class ChatServices {
  final FirebaseFirestore _firestor = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendMessage(String receiverId,receiveremail, message) async {
    final String currentuserId = _auth.currentUser!.uid;
    final String currentuseEmail = _auth.currentUser!.email.toString();
    final tiemStamp = Timestamp.now();

    messages_model newMessage = messages_model(
        senderId: currentuserId,
        senderEmail: currentuseEmail,
        receiverId: receiverId,
        receiverEmail: receiveremail,
        timestamp: tiemStamp,
        message: message,
        );

    List<String> ids = [currentuserId, receiverId];

    ids.sort();

    String chatroomId = ids.join('_');

    await _firestor
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userId, otheruseID) {
    List<String> ids = [userId, otheruseID];
    ids.sort();
    String chatroomsId = ids.join('_');

    return _firestor
        .collection("chat_rooms")
        .doc(chatroomsId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
>>>>>>> master
