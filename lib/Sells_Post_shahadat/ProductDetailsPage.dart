import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/chating/pages/chat_with_use.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final _auth = FirebaseAuth.instance;
  final _firestor=FirebaseFirestore.instance;

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
        backgroundColor: const Color.fromARGB(255, 112, 111, 111),
        title: Text(
          product.name,
          style: TextStyle(color: Colors.white, fontFamily: 'Schyler'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 58, 56, 56)
        ),
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
                        color: const Color.fromARGB(255, 108, 107, 107),
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
                        style: const TextStyle(
                            color: Color.fromARGB(255, 181, 177, 177),
                            fontFamily: 'Schyler',
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Text(
                        'Seller Contact:',
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
                        product.sellerContact!,
                        style: TextStyle(
                            color: Color.fromARGB(255, 181, 177, 177),
                            fontFamily: 'Schyler',
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      _auth.currentUser!.uid.toString() !=
                              product.uid.toString()
                          ? Padding(
                              padding:const EdgeInsets.all(20),
                              child: InkWell(
                                onTap: () async {
                                  // if(_auth.currentUser!.uid!=product.uid)
                                  await _firestor.collection('users').doc(_auth.currentUser!.uid).update({
                                      'chatList': FieldValue.arrayUnion([product.uid])
                                    });
                                  await _firestor.collection('users').doc(product.uid).update({
                                      'chatList': FieldValue.arrayUnion([_auth.currentUser!.uid])
                                    });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatUser(uid: product.uid.toString(),sellerName: product.sellerName.toString(),)));
                                  // launch(
                                  //     'sms:01311836866?body=Type your material name');
                                },
                                child: Center(
                                  child: Container(
                                    width: width * 0.5,
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
                                      color: Color.fromARGB(255, 98, 103, 98),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Chat with seller',
                                        style: TextStyle(
                                            fontFamily: 'Schyler',
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: height * 0.004,
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
