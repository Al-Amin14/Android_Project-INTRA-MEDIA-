import 'dart:ffi';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:intra_media/Sells_Post_shahadat/ProductDetailsPage.dart';
import 'package:intra_media/Sells_Post_shahadat/Product.dart';
import 'package:intra_media/Sells_Post_shahadat/Homepage.dart';
import 'package:intra_media/Sells_Post_shahadat/BuyPage.dart';
import 'package:intra_media/Sells_Post_shahadat/SellPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/outline_borderss.dart';
import 'package:intra_media/auth_methods/storing_data_on_firebase.dart';
import 'package:uuid/uuid.dart';

/*class SellPage extends StatefulWidget {
  final Function(Product) addProduct;

  SellPage({required this.addProduct});

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController=TextEditingController();
  final _sellerNameController = TextEditingController();
  final _sellerContactController = TextEditingController();
  File? _selectedImage;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _sellerNameController.dispose();
    _sellerContactController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        sellerName: _sellerNameController.text,
        sellerContact: _sellerContactController.text,
        image: _selectedImage,
      );
      widget.addProduct(product);
      // Clear the form
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _sellerNameController.clear();
      _sellerContactController.clear();
      _selectedImage = null;
      // Show success message (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10.0),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price of  Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price of your product';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _sellerNameController,
                decoration: InputDecoration(labelText: 'Name of the Seller'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _locationController,
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the loaction of your product';
                  }

                  return null;
                },
              ),
              SizedBox(height:10
              ),
              TextFormField(
                controller: _sellerContactController,
                decoration: InputDecoration(labelText: 'Seller Contact'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller contact';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _getImage,

                child: Text('Upload Image of Product'
                ),

              ),
              SizedBox(height: 10.0),
              if (_selectedImage != null)
                Image.file(
                  _selectedImage!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _submitForm,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
class SellPage extends StatefulWidget {
  final uid;
  // final Function(Product) addProduct;

  SellPage({ required this.uid});

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  var photoUrl;
  var showProgress = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController = TextEditingController();
  final _sellerContactController = TextEditingController();
  Uint8List? _selectedImage;
  var geting_user_details;
  var data_keep;

  @override
  void initState() {
    super.initState();
    Storing_my_data();
  }

  void Storing_my_data() async {
    var geting_user_details = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get();
    data_keep = geting_user_details.data();
  }

  Future<void> _getImage() async {
    Uint8List file = await Utils().pickImgae(ImageSource.gallery);
    if (file != null) {
      setState(() {
        _selectedImage = file;
        conver_to_image_url();
      });
    }
  }

  conver_to_image_url() async {
    photoUrl = await storage_methods_auth()
        .uploadImageto_Storage('Product_post', _selectedImage!, true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _sellerContactController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    setState(() {
      showProgress = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_formKey.currentState!.validate()) {
        await conver_to_image_url();

        String ProductId = const Uuid().v1();
        final product = {
          'name': _nameController.text,
          'description': _descriptionController.text,
          'price': double.parse(_priceController.text),
          'sellerName': data_keep['username'].toString(),
          'sellerContact': _sellerContactController.text,
          'datetime': DateFormat.yMMMd().format(DateTime.now()).toString(),
          'image': photoUrl,
          'uid':widget.uid,
          'ProductId':ProductId,
          'timestamp': FieldValue.serverTimestamp(),
        };
        /* widget.addProduct(product);
      // Clear the form
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _sellerNameController.clear();
      _sellerContactController.clear();
      _selectedImage = null;
      // Show success message (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added!')),
      );
    }*/
        await FirebaseFirestore.instance
            .collection('products').
            doc(ProductId)
            .set(product)
            .then((value) {
          showProgress = false;
          // Clear the form after successful submission
          setState(() {
            _nameController.text = "";
            _descriptionController.text = "";
            _priceController.text = "";
            _sellerContactController.text = "";
            _locationController.text = "";
            _selectedImage = null;
          });

          // Show success message (optional)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product added!')),
          );
        }).catchError((error) {
          // Handle errors, e.g., show an error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add product: $error')),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  enabledBorder: for_enable_focusing(),
                  focusedBorder: forfocusing(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  enabledBorder: for_enable_focusing(),
                  focusedBorder: forfocusing(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price of  Product',
                  enabledBorder: for_enable_focusing(),
                  focusedBorder: forfocusing(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price of your product';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _locationController,
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Location',
                  enabledBorder: for_enable_focusing(),
                  focusedBorder: forfocusing(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the loaction of your product';
                  }

                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _sellerContactController,
                decoration: InputDecoration(
                  labelText: 'Seller Contact',
                  enabledBorder: for_enable_focusing(),
                  focusedBorder: forfocusing(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller contact';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _getImage,
                child: Text('Upload Image of Product'),
              ),
              SizedBox(height: 10.0),
              if (_selectedImage != null)
                Container(
                  width: width * 0.7,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(_selectedImage!),
                      )),
                ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _submitForm,
                child: Text('Add Product'),
              ),
              showProgress
                  ? const LinearProgressIndicator(minHeight: 30)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
