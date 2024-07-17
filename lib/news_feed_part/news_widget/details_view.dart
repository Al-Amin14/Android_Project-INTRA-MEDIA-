import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Details_View_News extends StatelessWidget {
  final Image_show;
  final title_str;
  final timeing_post;
  final news_source;
  final deatails_news;
  const Details_View_News(
      {super.key,
      this.Image_show,
      this.title_str,
      this.timeing_post,
      this.deatails_news, this.news_source});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return 
    Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.05,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: CachedNetworkImage(
                height: height * 0.5,
                width: width,
                imageUrl: Image_show,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    SpinKitCircle(size: 40, color: Colors.blue),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: height*0.4,
            width: width*0.95,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 91, 86, 86),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      title_str,
                      style: TextStyle(
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 162, 197, 208),fontSize: 17),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Container(
                        width: width * 0.15,
                            child: Text(
                              news_source,
                              style: TextStyle(
                                  fontFamily: 'Schyler',
                                  fontSize: 10,
                                  color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        Spacer(),
                        Container(
                        width: width * 0.15,
                        child: Text(
                          timeing_post,
                          style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 10,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                        ],
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Text(
                      deatails_news,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
