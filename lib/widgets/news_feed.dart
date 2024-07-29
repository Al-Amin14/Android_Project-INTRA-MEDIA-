import 'package:flutter/material.dart';
import 'package:intra_media/news_feed_part/splash_for_new_feed.dart';

class new_feed extends StatefulWidget {
  const new_feed({super.key});

  @override
  State<new_feed> createState() => _new_feedState();
}

class _new_feedState extends State<new_feed> {
  @override
  Widget build(BuildContext context) {
    return News_feed_splash_screen();
  }
}