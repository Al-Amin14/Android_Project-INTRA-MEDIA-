import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intra_media/news_feed_part/news_widget/news_home_view.dart';

class News_feed_splash_screen extends StatefulWidget {
  const News_feed_splash_screen({super.key});

  @override
  State<News_feed_splash_screen> createState() =>
      _News_feed_splash_screenState();
}

class _News_feed_splash_screenState extends State<News_feed_splash_screen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MYnewsSection_screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 159, 82, 165)])),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'image/splash_src.jpg',
                  fit: BoxFit.cover,
                  width: width * 0.8,
                  height: height * 0.6,
                )),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'News Feed',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        offset: Offset(1, 2),
                        blurRadius: 12.0,
                        color: Colors.white)
                  ],
                  color: Color.fromARGB(255, 69, 67, 67),
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SpinKitCubeGrid(
              color: Colors.white,
              size: 45,
            )
          ],
        ),
      ),
    );
  }
}
