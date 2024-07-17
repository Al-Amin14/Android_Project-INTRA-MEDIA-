import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/outline_borderss.dart';
import 'package:intra_media/Widget_ForGloblaUse/text_form_filed.dart';
import 'package:intra_media/auth_methods/Auth_methods_for_sing_up.dart';
import 'package:intra_media/auth_methods/auth_methods_for_alumnia_data_storing.dart';

class SignUpAlumnai extends StatefulWidget {
  const SignUpAlumnai({super.key});

  @override
  State<SignUpAlumnai> createState() => _SignUpAlumnaiState();
}

class _SignUpAlumnaiState extends State<SignUpAlumnai> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _department = TextEditingController();
  final linkedinId = TextEditingController();
  final jobdetails = TextEditingController();
  final bio = TextEditingController();
  final github = TextEditingController();
  final fullname = TextEditingController();
  final batch_name = TextEditingController();
  final contact_email = TextEditingController();

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
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Colors.green,
                    Color.fromARGB(255, 40, 165, 117),
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
                      style:
                          TextStyle(fontSize: 50,fontFamily: 'Schyler'),
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
                        Padding(padding: EdgeInsets.all(10),
                        child: Text('Choose your profile pic',style: TextStyle(fontFamily: 'Schyler',fontSize: 20,),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: height * 0.7,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  spreadRadius: 7.5,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: TextFormField(
                                    obscureText: true,
                                    style: TextStyle(color: Colors.black,fontFamily: 'Schyler'),
                                    controller:_pass,
                                    decoration: InputDecoration(
                                        hintText: 'Enter your password 1-8 letter',
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        prefixIcon: Icon(Icons.lock,color: Colors.black,),
                                        focusedBorder: forfocusing(),
                                        enabledBorder: for_enable_focusing()),
                                  ),),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text_form_fields(
                                    storingdata: _department,
                                    hint_text_provide:
                                        'Enter what your department was',
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
                                    storingdata: linkedinId,
                                    hint_text_provide:
                                        'Enter your linkedIn id link',
                                    icons_provide: Icon(
                                      FontAwesomeIcons.linkedin,
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
                                    storingdata: github,
                                    hint_text_provide:
                                        'Enter your github id link',
                                    icons_provide: Icon(
                                      FontAwesomeIcons.github,
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
                                    storingdata: contact_email,
                                    hint_text_provide: 'Contact Email',
                                    icons_provide: Icon(
                                      Icons.email_rounded,
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
                                    storingdata: fullname,
                                    hint_text_provide: 'Enter you full-name',
                                    icons_provide: Icon(
                                      Icons.details,
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
                                    storingdata: batch_name,
                                    hint_text_provide: 'Enter your batch name',
                                    icons_provide: Icon(
                                      Icons.batch_prediction,
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
                                    storingdata: jobdetails,
                                    hint_text_provide:
                                        'Enter you current Job and your details about your professions also with skills',
                                    icons_provide: Icon(
                                      Icons.format_align_justify_rounded,
                                      color: Colors.black,
                                    ),
                                    maxline: 3,
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
                              singUP_for_Alumni(
                                emial_alm: _email,
                                department: _department,
                                bio: bio,
                                file: _image,
                                pass_alm: _pass,
                                jobdetails: jobdetails,
                                linkIDin: linkedinId,
                                Batch: batch_name,
                                Contactemail: contact_email,
                                fullname: fullname,
                                github: github,
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
