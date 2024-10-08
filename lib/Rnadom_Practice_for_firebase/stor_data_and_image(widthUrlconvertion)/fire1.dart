// Long in auth , stor data and Post
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intra_media/Rnadom_Practice_for_firebase/stor_data_and_image(widthUrlconvertion)/sotoring_first.dart';

class First_prac extends StatefulWidget {
  const First_prac({super.key});

  @override
  State<First_prac> createState() => _First_pracState();
}

class _First_pracState extends State<First_prac> {
  final pass = TextEditingController();
  final email = TextEditingController();
  final bio = TextEditingController();
  final contact = TextEditingController();
  Uint8List? image;
  selectiongImgage() async {
    final pickimgae = ImagePicker();
    XFile? file = await pickimgae.pickImage(source: ImageSource.camera);
    return await file!.readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  selectiongImgage();
                },
                icon: FaIcon(
                  FontAwesomeIcons.add,
                  size: 30,
                )),
            TextFormField(
              controller: pass,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            TextFormField(
              controller: email,
            ),
            TextFormField(
              controller: bio,
            ),
            TextFormField(
              controller: contact,
            ),
            Sotoring_first_data(
              pass: pass.text.toString(),
              email: email.text.toString(),
              bio: bio.text.toString(),
              contact: contact.text.toString(),
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
