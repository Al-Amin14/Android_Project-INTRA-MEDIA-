import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/text_form_filed.dart';
import 'package:intra_media/auth_methods/Authencation_Methos.dart';
import 'package:intra_media/login_screen/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intra_media/prividers/user_providers.dart';
import 'package:intra_media/widgets/home_page.dart';
import 'package:provider/provider.dart';

class Longin_screen extends StatefulWidget {
  const Longin_screen({super.key});

  @override
  State<Longin_screen> createState() => _Longin_screenState();
}

class _Longin_screenState extends State<Longin_screen> {
  bool looding = false;
  final email_controller = TextEditingController();
  final passwordcontroller = TextEditingController();

  

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
                      height: 150,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: "INTRA",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                shadows: [
                                  Shadow(
                                    offset: Offset(20.0, 30.0),
                                    blurRadius: 30.0,
                                    color: Color.fromARGB(255, 70, 67, 67),
                                  ),
                                ]),
                          ),
                        ])),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "MEDIA",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  offset: Offset(20.0, 30.0),
                                  blurRadius: 30.0,
                                  color: Color.fromARGB(255, 70, 67, 67),
                                ),
                              ]))
                    ])),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text_form_fields(
                          storingdata: email_controller,
                          hint_text_provide: 'Enter your email',
                          icons_provide: Icon(Icons.email,color: Colors.black,),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text_form_fields(
                          storingdata: passwordcontroller,
                          hint_text_provide: 'Enter you password(1-8 letters)',
                          icons_provide: Icon(Icons.lock,color: Colors.black,),
                          ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Authentication_of_apps(email_controller: email_controller, passwordcontroller: passwordcontroller),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Or',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SigngUp())));
                        },
                        child: Container(
                          width: 200,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 43, 43, 43),
                        ))
                  ],
                ),
              ))),
    );
  }
}
