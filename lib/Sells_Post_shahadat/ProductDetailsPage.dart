import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intra_media/Sells_Post_shahadat/ProductDetailsPage.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Sells_Post_shahadat/Homepage.dart';
import 'package:intra_media/Sells_Post_shahadat/BuyPage.dart';
import 'package:intra_media/Sells_Post_shahadat/SellPage.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:

          [
            if (product.image != null)
              Image.file(
                product.image!,
                height: 20,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                // Change text color to blue
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
                // backgroundColor:Colors.blueAccent

              ),
            ),
            SizedBox(height: 8.0),
            Text(product.description),
            SizedBox(height: 16.0),
            Text(
              'Price:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
                //backgroundColor:Colors.blueAccent
              ),
            ),
            SizedBox(height: 8.0),
            Text('\$${product.price.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            if (product.sellerName != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seller:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                      // backgroundColor:Colors.blueAccent
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(product.sellerName!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}


