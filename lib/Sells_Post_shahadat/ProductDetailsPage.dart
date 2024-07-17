import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intra_media/Sells_Post_shahadat/ProductDetailsPage.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Sells_Post_shahadat/Homepage.dart';
import 'package:intra_media/Sells_Post_shahadat/BuyPage.dart';
import 'package:intra_media/Sells_Post_shahadat/SellPage.dart';
import 'package:intra_media/Utils/Colors.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: mobileBackgroundColor,
        title: Text(
          product.name,
          style: TextStyle(color: Colors.white, fontFamily: 'Schyler'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (product.image != null)
                  Container(
                    width: width * 0.7,
                    height: height * 0.35,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.5,
                            spreadRadius: 5.3,
                            color: Colors.white,
                            offset: Offset(1, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(product.image!),
                        )),
                  )
                else
                  SpinKitCircle(
                    size: 40,
                    color: Colors.white,
                  ),
                SizedBox(height: 16.0),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    // Change text color to blue
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    // backgroundColor:Colors.blueAccent
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  product.description,
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 177, 177),
                      fontFamily: 'Schyler',
                      fontSize: 15),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Price:',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Schyler',
                    color: Color.fromARGB(255, 255, 255, 255),
                    //backgroundColor:Colors.blueAccent
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\BDT ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 177, 177),
                      fontFamily: 'Schyler',
                      fontSize: 15),
                ),
                SizedBox(height: 16.0),
                if (product.sellerName != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seller:',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Schyler',
                            color: Color.fromARGB(255, 238, 238, 238),
                            decoration: TextDecoration.underline
                            // backgroundColor:Colors.blueAccent
                            ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        product.sellerName!,
                        style: TextStyle(
                            color: Color.fromARGB(255, 181, 177, 177),
                            fontFamily: 'Schyler',
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Center(
                          child: Container(
                            width: width * 0.8,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5.2,
                                    spreadRadius: 5.2,
                                    offset: Offset(1, 1),
                                    color: Colors.white)
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 73, 98, 73),
                            ),
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                    fontFamily: 'Schyler',
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
