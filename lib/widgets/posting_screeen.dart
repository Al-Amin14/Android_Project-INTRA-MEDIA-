<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:0100cf3be2a9e5d47ad21d28c222b8d4994aae12045e426bedab0b4217c489d1
size 10014
=======
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/Utils/user_details.dart' as model;
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/Text_form_field_sec.dart';
import 'package:intra_media/auth_methods/Auth_methods_fire_post_storing.dart';
import 'package:intra_media/prividers/user_providers.dart';
import 'package:provider/provider.dart';

class Posting_screeen extends StatefulWidget {
  const Posting_screeen({super.key});

  @override
  State<Posting_screeen> createState() => _Posting_screeenState();
}

class _Posting_screeenState extends State<Posting_screeen> {
  bool show_post2 = false;
  String res = "";
  final post_storing = TextEditingController();
  Uint8List? _file;
  void poostImage_on_fire(
    String uid,
    String username,
    String proImage,
  ) async {
    try {
      res = await firebase_storing_data().uploadPost_onfirestor(
          post_storing.text, _file, uid, username, proImage);
    } catch (e) {
      res = e.toString();
    }
    if (res == "Posted") {
      setState(() {
        res == "";
      });
    }
  }

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
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(12),
                child: Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    model.User__ user = Provider.of<UserProvider>(context).getUser;

    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _file != null
            ? Scaffold(
                backgroundColor: mobileBackgroundColor,
                appBar: AppBar(
                  backgroundColor: mobileBackgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _file = null;
                        res = "";
                      });
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        poostImage_on_fire(
                          user.uid,
                          user.username,
                          user.PhotoUrl,
                        );
                        setState(() {
                          res = "_";
                        });
                      },
                      child: const Text(
                        'Post',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 4, 105, 21)),
                      ),
                    )
                  ],
                ),
                body: Container(
                  height: double.infinity,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: res == "_"
                                ? LinearProgressIndicator(
                                    color: Colors.blue,
                                  )
                                : Container(),
                          ),
                          Container(
                            height: height * .2,
                            width: width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    user.PhotoUrl,
                                  ),
                                  fit: BoxFit.cover,
                                  alignment: FractionalOffset.topCenter,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.4,
                            width: width * 0.6,
                            child: Text_form_second(
                                storingdata: post_storing,
                                hint_text_provide: 'What is in you mind.....'),
                          ),
                          SizedBox(height: height * 0.1),
                          Container(
                            width: width * 0.7,
                            height: height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: MemoryImage(_file!),
                                )),
                          ),
                          SizedBox(
                            height: height * 0.3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: mobileBackgroundColor,
                appBar: AppBar(
                  backgroundColor: mobileBackgroundColor,
                  toolbarHeight: 80,
                  centerTitle: true,
                  title: Text(
                    'Post Your interest',
                    style: TextStyle(
                        fontFamily: 'Schyler',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                body: Center(
                  child: Container(
                    height: height * 0.7,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 52, 117, 78),
                          Color.fromARGB(255, 19, 19, 19)
                        ]),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.2,
                            spreadRadius: 12.2,
                            color: Color.fromARGB(255, 124, 125, 124),
                            offset: Offset(1, 1),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: IconButton(
                                onPressed: () {
                                  _selectImage(context);
                                },
                                icon: Icon(
                                  Icons.upload,
                                  color: Colors.white,
                                  size: 50,
                                ))),
                        SizedBox(
                          height: height * 0.001,
                        ),
                        Text(
                          'Upload',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Schyler',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
>>>>>>> master
