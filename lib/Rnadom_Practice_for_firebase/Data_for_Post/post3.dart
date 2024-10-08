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
