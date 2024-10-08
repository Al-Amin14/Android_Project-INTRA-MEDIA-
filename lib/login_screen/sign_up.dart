import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/outline_borderss.dart';
import 'package:intra_media/Widget_ForGloblaUse/text_form_filed.dart';
import 'package:intra_media/auth_methods/Auth_methods_for_sing_up.dart';

class SigngUp extends StatefulWidget {
  const SigngUp({super.key});

  @override
  State<SigngUp> createState() => _SigngUpState();
}

class _SigngUpState extends State<SigngUp> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _department = TextEditingController();
  final semester = TextEditingController();
  final bio = TextEditingController();
  Uint8List? _image;

  bool show_eye = false;

  void selected_image() async {
    Uint8List im = await Utils().pickImgae(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Colors.green,
                    Colors.white,
                    const Color.fromARGB(255, 47, 33, 33)
                  ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Text(
                      "Sing up now",
                      style: TextStyle(fontSize: 50, fontFamily: 'Schyler'),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            _image == null
                                ? CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/736x/2e/dd/02/2edd02160b51797f7adb807a79d96d36.jpg'),
                                  )
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage: MemoryImage(_image!),
                                  ),
                            Positioned(
                                bottom: -1,
                                left: 100,
                                right: -15,
                                top: 80,
                                child: IconButton(
                                  onPressed: () {
                                    selected_image();
                                  },
                                  icon: FaIcon(
                                    Icons.add_a_photo,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 30,
                                  ),
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Choose your profile pic',
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        height: 450,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(255, 102, 98, 98),
                                  spreadRadius: 12.5,
                                  blurRadius: 7,
                                  offset: Offset(1, 1))
                            ],
                            color: Color.fromARGB(255, 134, 216, 143),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text_form_fields(
                                    storingdata: _email,
                                    hint_text_provide: 'Enter your email',
                                    icons_provide: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Schyler'),
                                  controller: _pass,
                                  decoration: InputDecoration(
                                      hintText:
                                          'Enter your password 1-8 letter',
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                      ),
                                      focusedBorder: forfocusing(),
                                      enabledBorder: for_enable_focusing()),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text_form_fields(
                                    storingdata: _department,
                                    hint_text_provide: 'Enter your department',
                                    icons_provide: Icon(
                                      Icons.folder_shared,
                                      color: Colors.black,
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text_form_fields(
                                    storingdata: semester,
                                    hint_text_provide:
                                        'Enter your semester(1.1,1.2,2.1,2.2 .......)',
                                    icons_provide: Icon(
                                      Icons.book,
                                      color: Colors.black,
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text_form_fields(
                                    storingdata: bio,
                                    hint_text_provide: 'Enter you bio',
                                    icons_provide: Icon(
                                      Icons.data_array,
                                      color: Colors.black,
                                    ),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              auth_method_signupu(
                                emailing: _email,
                                passwording: _pass,
                                department: _department,
                                semester: semester,
                                bio: bio,
                                file: _image,
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
