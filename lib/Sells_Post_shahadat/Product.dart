import 'dart:io';
class Product {
  String name;
  String description;
  double price;
  String? sellerName;
  String? loaction;
  String? sellerContact;
  File? image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    this.sellerName,
    this.loaction,
    this.sellerContact,
    this.image,
  });
}
