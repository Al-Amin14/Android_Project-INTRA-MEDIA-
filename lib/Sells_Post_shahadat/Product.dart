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

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.datetime,
    this.sellerName,
    this.loaction,
    this.sellerContact,
    required this.image,
  });
}
