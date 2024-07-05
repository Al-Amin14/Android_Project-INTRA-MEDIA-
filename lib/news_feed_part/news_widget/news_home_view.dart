import 'package:flutter/material.dart';
import 'package:intra_media/news_feed_part/news_widget/catagory_news_page.dart';
import 'package:intra_media/news_feed_part/news_widget/view_news_wid.dart';

class MYnewsSection_screen extends StatefulWidget {
  const MYnewsSection_screen({super.key});

  @override
  State<MYnewsSection_screen> createState() => _MYnewsSection_screenState();
}

enum FilterList { bbcNews, independent, alJazira }

class _MYnewsSection_screenState extends State<MYnewsSection_screen> {
  FilterList? selectedMenu;
  String name = 'bbc-news';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 50.2,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => catagory_news_pages()));
          },
          icon: Icon(Icons.menu,
          color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'News',
          style: TextStyle(
              fontFamily: 'Schyler', fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
              initialValue: selectedMenu,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (FilterList item) {
                if (FilterList.bbcNews.name == item.name) {
                  name = 'bbc-news';
                }
                if (FilterList.alJazira.name == item.name) {
                  name = 'al-jazeera-english';
                }
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<FilterList>>[
                    PopupMenuItem(
                        value: FilterList.bbcNews, child: Text('BBC News')),
                    PopupMenuItem(
                        value: FilterList.alJazira,
                        child: Text('Al-Jazira News')),
                  ])
        ],
      ),
      body: News_view_model_wid(
        news_key: name,
      ),
    );
  }
}
