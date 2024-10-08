<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:08872da5d5858ae2f1c8f301b2f92636a39ae2905106ff6ca542055b991ba6c9
size 511
=======
class Post3 {
  final String discription;
  final String uid;
  final String username;
  final String postId;
  final String posturl;
  final likes;
  final datatimenow;
  Post3(this.discription, this.uid, this.username, this.postId, this.posturl,
      this.likes, this.datatimenow);
  Map<String, dynamic> toJson() => {
    'discription':discription,
    'uid':uid,
    'username':username,
    'postId':postId,
    'Posturl':posturl,
    'likes':likes,
    'datetime':datatimenow,
  };
}
>>>>>>> master
