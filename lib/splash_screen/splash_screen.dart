import 'package:flutter/material.dart';
import 'package:intra_media/splash_screen/splah_services/splash_sevices.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  final moving_sevices = splash_services();
  void initState() {
    super.initState();
    moving_sevices.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'WELCOME\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: 'TO\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: 'INTRA MEDIA\n',
                    style: TextStyle(
                      color: Color.fromARGB(255, 153, 247, 12),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
        ),
      ),
    );
  }
}
