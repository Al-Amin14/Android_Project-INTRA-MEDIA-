<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:5828570d0080c485934728929bea37dedb713e8b0518624185eb5a0cb28f8547
size 742
=======
import 'package:cloud_firestore/cloud_firestore.dart';

class messages_model {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String receiverEmail;
  final Timestamp timestamp;
  final String message;

  messages_model(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.receiverEmail,
      required this.timestamp,
      required this.message,
      });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'receiverEmail': receiverEmail,
      'timestamp': timestamp,
      'message': message,
    };
  }

}
>>>>>>> master
