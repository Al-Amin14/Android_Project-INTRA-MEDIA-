import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intra_media/Sells_Post_shahadat/ProductDetailsPage.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Sells_Post_shahadat/Homepage.dart';
import 'package:intra_media/Sells_Post_shahadat/BuyPage.dart';
import 'package:intra_media/Sells_Post_shahadat/SellPage.dart';

class BuyPage extends StatelessWidget {
  final List<Product> products;

  BuyPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            );
          },
          child: Card(
            child: ListTile(
              leading: product.image != null
                  ? Image.file(
                product.image!,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              )
                  : null,
              title: Text(
                product.name,
                style: TextStyle(
                  color: Colors.green.shade600, // Change text color to blue
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.description),
                  Text('\BDT ${product.price.toStringAsFixed(2)}'),
                  if (product.sellerName != null)
                    Text('Seller: ${product.sellerName}'),
                  if (product.sellerContact != null)
                    Text('Contact: ${product.sellerContact}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
