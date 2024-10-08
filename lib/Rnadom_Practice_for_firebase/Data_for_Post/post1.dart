class Post1 {
  final String discription;
  final String uid;
  final String username;
  final String postId;
  final String posturl;
  final likes;
  final datatimenow;
  Post1(this.uid, this.username, this.postId, this.posturl, this.likes,
      this.datatimenow, this.discription);
  Map<String, dynamic> toJson() => {
        "discription": discription,
        "uid": uid,
        "username": username,
        "postId": postId,
        "postUrl": posturl,
        "likes": likes,
        "datatimenow": datatimenow,
      };
}
