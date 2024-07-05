import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/Text_form_field_sec.dart';

class Post_second_part extends StatefulWidget {
  const Post_second_part({super.key});

  @override
  State<Post_second_part> createState() => _Post_second_partState();
}

class _Post_second_partState extends State<Post_second_part> {
  final post_storing = TextEditingController();
  Uint8List? _file;

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('create a post'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(12),
                child: Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await Utils().pickImgae(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(12),
                child: Text('Choose photo from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await Utils().pickImgae(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return _file==null?
    Scaffold(
      backgroundColor: mobileBackgroundColor,
      body:Container(child: Center(child: Text('sldkjlskdjfsajlkdfj',style: TextStyle(color: Colors.white),),),)
    ):
    Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Container(
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height * 0.4,
                  width: width * 0.6,
                  child: Text_form_second(
                      storingdata: post_storing,
                      hint_text_provide: 'What is in you mind'),
                ),
                SizedBox(height: height * 0.1),
                Container(
                  width: width * 0.7,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
