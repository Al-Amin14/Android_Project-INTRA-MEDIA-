import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:intra_media/news_feed_part/fetching_from_api/fetching_data.dart';
import 'package:intra_media/news_feed_part/news_widget/details_view.dart';

class Catagory_View_news extends StatelessWidget {
  final catagory_name;
  Catagory_View_news({super.key, required this.catagory_name});
  fetching_data _cata_news = fetching_data();

  final formate = DateFormat('MMMM dd,yyyy');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return FutureBuilder(
        future: _cata_news.fetchNewsCatagory_of_individual_Model(catagory_name),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingGrid(
                color: const Color.fromARGB(255, 35, 68, 52),
                size: 100,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                DateTime date_time = DateTime.parse(
                    snapshot.data!.articles![index].publishedAt.toString());
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(11),
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 77, 75, 75),
                            spreadRadius: 5.2,
                            blurRadius: 5.0,
                            offset: Offset(1, 1),
                          )
                        ],
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details_View_News(
                                    Image_show: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    title_str: snapshot
                                        .data!.articles![index].title
                                        .toString(),
                                    timeing_post: formate.format(date_time),
                                    news_source: snapshot
                                        .data!.articles![index].source!.name
                                        .toString(),
                                    deatails_news: snapshot
                                        .data!.articles![index].description
                                        .toString())));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              height: height * 0.2,
                              width: width * 0.35,
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
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
                          Expanded(
                            child: Container(
                              height: height * 0.2,
                              padding: EdgeInsets.symmetric(horizontal: 11),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data!.articles![index].title
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Schyler',
                                        fontSize: 15,
                                        color: Colors.white),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: width * 0.13,
                                        child: Text(
                                          snapshot.data!.articles![index]
                                              .source!.name
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Schyler',
                                              fontSize: 8,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.16,
                                        child: Text(
                                          formate.format(date_time),
                                          style: TextStyle(
                                              fontFamily: 'Schyler',
                                              fontSize: 6,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
