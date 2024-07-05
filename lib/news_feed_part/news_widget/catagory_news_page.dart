import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/news_feed_part/fetching_from_api/fetching_data.dart';
import 'package:intra_media/news_feed_part/news_widget/catagory_news_viewing.dart';

class catagory_news_pages extends StatefulWidget {
  const catagory_news_pages({super.key});

  @override
  State<catagory_news_pages> createState() => _catagory_news_pagesState();
}

class _catagory_news_pagesState extends State<catagory_news_pages> {
  
  String catagory_name = "General";
  List<String> catagoryNews = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Technology'
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.08,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catagoryNews.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      catagory_name = catagoryNews[index];
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: catagory_name == catagoryNews[index]
                                ? Color.fromARGB(255, 178, 197, 231)
                                : Colors.greenAccent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(1, 1),
                              )
                            ]),
                        child: Center(
                          child: Text(
                            catagoryNews[index].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Schyler',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(child: Catagory_View_news(catagory_name:catagory_name)),
        ],
      ),
    );
  }
}