import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/news_feed_part/fetching_data_after/get_data_after.dart';
import 'package:intra_media/news_feed_part/fetching_from_api/fetching_data.dart';
import 'package:intra_media/news_feed_part/model/news_chanals.dart';
import 'package:intra_media/news_feed_part/news_widget/catagory_news_viewing.dart';
import 'package:intra_media/news_feed_part/news_widget/details_view.dart';

class News_view_model_wid extends StatefulWidget {
  late String news_key;
  News_view_model_wid({super.key, required this.news_key});

  @override
  State<News_view_model_wid> createState() => _News_view_model_widState();
}

class _News_view_model_widState extends State<News_view_model_wid> {
  final formate = DateFormat("MMMM dd,yy");
  final news_view_data = fetch_data_after();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor:  Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.55,
              width: width,
              child: FutureBuilder<My_api_data_for_fetch>(
                  future:
                      fetching_data().fetchNewChannelHeadlineApi(widget.news_key),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitCubeGrid(
                          size: 50,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data_time = DateTime.parse(snapshot
                                .data!.articles![index].publishedAt
                                .toString());
                            return Container(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Details_View_News(Image_show: snapshot.data!.articles![index].urlToImage.toString(),
                                            title_str: snapshot.data!.articles![index].title.toString(),
                                            timeing_post: formate.format(data_time),
                                            news_source:snapshot.data!.articles![index].source
                                            !.name.toString(),
                                            deatails_news:snapshot.data!.articles![index].description.toString()
                                            )));
                                      },
                                      child: Container(
                                        height: height * 0.55,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 95, 94, 94),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(1, 1),
                                          )
                                        ]),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot
                                                .data!.articles![index].urlToImage
                                                .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                SpinKitCircle(
                                                    size: 40, color: Colors.blue),
                                            errorWidget: (context, url, error) =>
                                                Center(
                                              child: Icon(
                                                Icons.error,
                                                color: Colors.red,
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: height * 0.08,
                                    child: Container(
                                      height: height * 0.2,
                                      width: width * 0.7,
                                      alignment: Alignment.bottomCenter,
                                      padding: EdgeInsets.all(11),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(11),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .title
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Schyler',
                                                    fontSize: 15),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .articles![index]
                                                        .source!
                                                        .name
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Schyler',
                                                        fontSize: 10),
                                                  ),
                                                  Text(
                                                    formate.format(data_time),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Schyler',
                                                        fontSize: 10),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Tech News',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Schyler',
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Colors.black,
                      )
                    ]),
              ),
            ),
            Container(
                height: height * 0.9,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Catagory_View_news(catagory_name: 'Technology'))),
          ],
        ),
      ),
    );
  }
}
