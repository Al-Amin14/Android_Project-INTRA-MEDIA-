<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:dfce388bf474fd47afcffdf4b3645c3184236e7d441b4e04c0cbb21186842192
size 505
=======
import 'dart:io';

class Product {
  String name;
  String description;
  double price;
  String? sellerName;
  String? loaction;
  String? sellerContact;
  String datetime;
  String image;
  String? uid;
  String? ProductId;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.datetime,
    this.sellerName,
    this.loaction,
    this.sellerContact,
    required this.image,
    this.uid,
    this.ProductId,
  });
}
>>>>>>> master
