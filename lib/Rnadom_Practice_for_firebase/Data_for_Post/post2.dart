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