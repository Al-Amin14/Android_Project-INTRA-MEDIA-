<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:6fafd6caf729e58b9160257b38c99836feedf0d2af947e6e8ee97ac2acffb028
size 5658
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intra_media/Sells_Post_shahadat/ProductDetailsPage.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Sells_Post_shahadat/Homepage.dart';
import 'package:intra_media/Sells_Post_shahadat/BuyPage.dart';
import 'package:intra_media/Sells_Post_shahadat/SellPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sell & Buy App',
          style: TextStyle(
              color: Colors.white, // Set text color to white
              fontSize:20,
              fontStyle:FontStyle.italic
          ),
        ),
        backgroundColor: Colors.indigo[900], // Set background color to blue
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Sell'),
            Tab(text: 'Buy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SellPage(addProduct: _addProduct),
          BuyPage(products: _products),
        ],
      ),
    );
  }
}*/
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Stream<List<Product>> _productsStream;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchProducts();
  }

  void _fetchProducts() {
    _productsStream = FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Product(
      name: doc['name'],
      description: doc['description'],
      price: doc['price'].toDouble(),
      sellerName: doc['sellerName'],
      datetime: doc['datetime'],
      image:doc['image'],
      uid: doc['uid'],
      ProductId: doc['ProductId'],
      sellerContact: doc['sellerContact'],
      // image: File(doc['image']), // Assuming 'image' is stored as a file path in Firestore
    ))
        .toList());
  }

  // void _addProduct(Product product) {
  //   FirebaseFirestore.instance.collection('products').add({
  //     'name': product.name,
  //     'description': product.description,
  //     'price': product.price,
  //     'sellerName': product.sellerName,
  //     'sellerContact': product.sellerContact,
  //     'image': product.image,

  //   }).then((value) {
  //     // Successfully added product to Firestore
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Product added successfully!')),
  //     );
  //   }).catchError((error) {
  //     // Handle error adding product
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to add product: $error')),
  //     );
  //   });
  // }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sell & Buy Your Product',
          style: TextStyle(
            fontFamily: 'Schyler',
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 175, 106),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child: Text('Sell',style: TextStyle(fontFamily: 'Schyler',color: Colors.white),),),
            Tab(child: Text('Buy',style: TextStyle(fontFamily: 'Schyler',color: Colors.white),),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SellPage(
            uid: FirebaseAuth.instance.currentUser!.uid,),
          StreamBuilder<List<Product>>(
            stream: _productsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                return BuyPage(products: snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}

>>>>>>> master
