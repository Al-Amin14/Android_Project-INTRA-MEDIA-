<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:65795cb05adbbf7398bb10892b65b534e076e0c4f8b8d509f876036941449fcb
size 553
=======
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
>>>>>>> master
