<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:6a8f39e875ab4e498506d36560b3aaf15537c6d1d63e3896fa40625658ded49f
size 12073
=======
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:intra_media/Sells_Post_shahadat/ProductDetailsPage.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Sells_Post_shahadat/Homepage.dart';
import 'package:intra_media/Sells_Post_shahadat/BuyPage.dart';
import 'package:intra_media/Sells_Post_shahadat/SellPage.dart';
import 'package:intra_media/auth_methods/Auth_methods_fire_post_storing.dart';

class BuyPage extends StatelessWidget {
  final List<Product> products;
  final _auth = FirebaseAuth.instance;

  BuyPage({required this.products});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        // DateTime date_time = DateTime.parse(
        //   DateTime.now() as String,
        // );
        final product = products[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(11),
            width: width * 0.9,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 77, 75, 75),
                spreadRadius: 5.2,
                blurRadius: 5.0,
                offset: Offset(1, 1),
              )
            ], color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsPage(product: product),
                    ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      height: height * 0.2,
                      width: width * 0.35,
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          SpinKitCircle(size: 40, color: Colors.blue),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: height * 0.2,
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                    fontFamily: 'Schyler',
                                    fontSize: 15,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              _auth.currentUser!.uid.toString() == product.uid.toString()
                                  ? IconButton(
                                      onPressed: () {
                                        print(
                                            _auth.currentUser!.uid.toString() +
                                                "    " +
                                                product.uid.toString());
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                  child: ListView(
                                                      shrinkWrap: true,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 16),
                                                      children: [
                                                        'Delete',
                                                      ]
                                                          .map(
                                                            (e) => InkWell(
                                                              onTap: () async {
                                                                firebase_storing_data()
                                                                    .deletingProduct(
                                                                        product.ProductId
                                                                            .toString(),context);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            12,
                                                                        horizontal:
                                                                            12),
                                                                child: Text(e),
                                                              ),
                                                            ),
                                                          )
                                                          .toList()),
                                                ));
                                      },
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ))
                                  : Container(),
                            ],
                          ),
                          Text(
                            product.description,
                            style: TextStyle(
                                fontFamily: 'Schyler',
                                fontSize: 10,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\BDT ${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontFamily: 'Schyler',
                                fontSize: 12,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Seller: ${product.sellerName}',
                            style: TextStyle(
                                fontFamily: 'Schyler',
                                fontSize: 12,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Contact: ${product.sellerContact}',
                            style: TextStyle(
                                fontFamily: 'Schyler',
                                fontSize: 12,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width * 0.2,
                                child: Text(
                                  'Department: CSE',
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontSize: 8,
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: width * 0.15,
                                child: Text(
                                  product.datetime.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Schyler',
                                      fontSize: 8,
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );

        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => ProductDetailsPage(product: product),
        //       ),
        //     );
        //   },
        //   child: Card(
        //     child: ListTile(
        //       leading: product.image != null
        //           ? Image.file(
        //         product.image!,
        //         height: 50,
        //         width: 50,
        //         fit: BoxFit.cover,
        //       )
        //           : null,
        //       title: Text(
        //         product.name,
        //         style: TextStyle(
        //           color: Colors.green.shade600, // Change text color to blue
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //       subtitle: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(product.description),
        //           Text('\BDT ${product.price.toStringAsFixed(2)}'),
        //           if (product.sellerName != null)
        //             Text('Seller: ${product.sellerName}'),
        //           if (product.sellerContact != null)
        //             Text('Contact: ${product.sellerContact}'),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
      },
    );
  }
}
>>>>>>> master
