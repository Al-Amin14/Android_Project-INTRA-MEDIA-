<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:7677d7caef7116ebcf95d66ab4051d6fbac48493df8f8b58d9399da20aebb75d
size 8321
=======
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intra_media/Utils/utils.dart';
import 'package:intra_media/Widget_ForGloblaUse/outline_borderss.dart';
import 'package:intra_media/Widget_ForGloblaUse/text_form_filed.dart';
import 'package:intra_media/auth_methods/Authencation_Methos.dart';
import 'package:intra_media/login_screen/alumnai_or_student.dart';
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
                      height: 125,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: "INTRA",
                            style: TextStyle(
                                fontFamily: 'Schyler',
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "MEDIA",
                          style: TextStyle(
                              fontFamily: 'Schyler',
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
                      height: 30,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text_form_fields(
                          storingdata: email_controller,
                          hint_text_provide: 'Enter your email',
                          icons_provide: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Schyler'),
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            hintText: 'Enter your password 1-8 letter',
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
                    Authentication_of_apps(
                        email_controller: email_controller,
                        passwordcontroller: passwordcontroller),
                    SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      Alumnai_Or_Student())));
                        },
                        child: Container(
                          width: 150,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 43, 43, 43),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'or you can sing in with',
                      style: TextStyle(
                          fontFamily: 'Schyler',
                          color: const Color.fromARGB(255, 86, 84, 84)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 20.5,
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8TnrQxTZSfvVAv5WMvi3cNJZdO09N-NfkXQ&s')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 20.5,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              'https://i.pinimg.com/564x/97/02/86/970286efc58cca663b7648a6582bc549.jpg',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
>>>>>>> master
