<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:07191c81e035ab977ad63144e3124bae0e35b40eccecfbd3e89b3bab565b9bea
size 3267
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intra_media/prividers/user_providers.dart';
import 'package:intra_media/widgets/alumni.dart';
import 'package:intra_media/widgets/apphome_page.dart';
import 'package:intra_media/widgets/news_feed.dart';
import 'package:intra_media/widgets/notes_resource.dart';
import 'package:intra_media/widgets/posting_screeen.dart';
import 'package:intra_media/widgets/profile.dart';
import 'package:intra_media/widgets/sells_post.dart';
import 'package:provider/provider.dart';

class Home_page_Screen extends StatefulWidget {
  const Home_page_Screen({super.key});

  @override
  State<Home_page_Screen> createState() => _Home_page_ScreenState();
}

class _Home_page_ScreenState extends State<Home_page_Screen> {
  var iscollectec = false;

  var pages = [
    Myapp_home_page(),
    sells_post(),
    new_feed(),
    Posting_screeen(),
    Notes_resourse(),
    Allumnai(),
    Myprofile(
      uid: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];

  var index = 0;

  void initState() {
    setState(() {
      iscollectec = false;
    });
    super.initState();
    addData();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes_resourse()));
  }

  addData() async {
    print(
        "------------++++++++++++++++++++++++++++++++++++++++++++------------------");
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refersUser();
    print("Printing data here______________________________________---------------------------");
    print(_userProvider.refersUser());
    setState(() {
      iscollectec = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(FontAwesomeIcons.home, size: 30),
      Icon(
        Icons.sell_sharp,
        size: 30,
      ),
      Icon(Icons.newspaper, size: 30),
      Icon(
        Icons.add,
        size: 30,
      ),
      Icon(
        Icons.note_alt,
        size: 30,
      ),
      FaIcon(
        Icons.people_alt,
        size: 30,
      ),
      FaIcon(
        FontAwesomeIcons.user,
        size: 30,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: iscollectec == false
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : pages[index],
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          color: const Color.fromARGB(255, 76, 175, 106),
          animationDuration: Duration(milliseconds: 300),
          height: 50,
          backgroundColor: const Color.fromARGB(255, 41, 66, 42),
          items: items,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
>>>>>>> master
