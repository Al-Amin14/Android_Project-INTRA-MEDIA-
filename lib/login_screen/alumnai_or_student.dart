<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:a685b732c8af82e6931a84978509d9c37840827850cabee5ff4fffd2b9fa5cc8
size 4376
=======
import 'package:flutter/material.dart';
import 'package:intra_media/login_screen/sign_up.dart';
import 'package:intra_media/login_screen/sign_up_alumnai.dart';

class Alumnai_Or_Student extends StatefulWidget {
  const Alumnai_Or_Student({super.key});

  @override
  State<Alumnai_Or_Student> createState() => _Alumnai_Or_StudentState();
}

class _Alumnai_Or_StudentState extends State<Alumnai_Or_Student> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.green,
          Colors.white,
          const Color.fromARGB(255, 47, 33, 33)
        ], begin: FractionalOffset(0.0, 0.0), end: FractionalOffset(1.0, 1.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigngUp()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.2,
                          color: Colors.white,
                          spreadRadius: 12.0,
                          offset: Offset(1, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 38, 62, 66),
                        Color.fromARGB(255, 72, 113, 95)
                      ])),
                  child: Center(
                      child: Text('STUDENT',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Schyler',
                              fontSize: 30))),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text('Or', style: stylingText),
            SizedBox(
              height: height * 0.05,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpAlumnai()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.2,
                          color: Colors.white,
                          spreadRadius: 12.0,
                          offset: Offset(1, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 38, 62, 66),
                        Color.fromARGB(255, 72, 113, 95)
                      ])),
                  child: Center(
                      child: Text('ALUMNI',
                          style: TextStyle(
                              fontFamily: 'Schyler',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                              decoration: TextDecoration.none))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final stylingText = TextStyle(
    fontFamily: 'Schyler',
    fontWeight: FontWeight.bold,
    fontSize: 50,
    color: Color.fromARGB(255, 8, 8, 8),
    decoration: TextDecoration.none);
>>>>>>> master
