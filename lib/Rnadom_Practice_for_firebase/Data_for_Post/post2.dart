<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:927c3e8eefbe1682db434f5ff232558a4f81abc11b2f905e2c66b1f7da2b2a58
size 544
=======
class Post2 {
  final String discription;
  final String uid;
  final String username;
  final String postId;
  final String posturl;
  final likes;
  final datatimenow;
  Post2(this.discription, this.uid, this.username, this.postId, this.posturl,
      this.likes, this.datatimenow);
  Map<String, dynamic> toJsson() => {
        'discription': discription,
        'uid': uid,
        'username':username,
        'postID':postId,
        'posturl':posturl,
        'likes':likes,
        'datatime':datatimenow,
      };
}
>>>>>>> master
