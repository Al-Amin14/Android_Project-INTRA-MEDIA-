import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intra_media/Utils/Colors.dart';
import 'package:intra_media/widgets/alumni_card.dart';
import 'package:intra_media/widgets/profile.dart';

class Allumnai extends StatefulWidget {
  const Allumnai({super.key});

  @override
  State<Allumnai> createState() => _AllumnaiState();
}

class _AllumnaiState extends State<Allumnai> {
  TextEditingController searching_user = TextEditingController();
  bool showuserSearch = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 151, 151),
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        toolbarHeight: 80,
        centerTitle: true,
        title: TextFormField(
          style: TextStyle(color: Colors.white,fontFamily: 'Schyler',fontWeight: FontWeight.bold,fontSize: 20),
          controller: searching_user,
          decoration: InputDecoration(
            labelStyle:TextStyle(color: Colors.white),
            labelText: 'Search User',
          ),
          onFieldSubmitted: (String _) {
            print(_);
            if (_.length != 0) {
              setState(() {
                showuserSearch = true;
              });
            } else {
              setState(() {
                showuserSearch = false;
              });
            }
          },
        ),
      ),
      body: showuserSearch == true
          ? StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('username',
                      isGreaterThanOrEqualTo: searching_user.text.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: SpinKitCircle(
                      color: Colors.black,
                      size: 60,
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Myprofile(uid:snapshot.data!.docs[index].data()['uid'])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Container(
                            height: height*0.1,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 68, 64, 64),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 50.5,
                                  backgroundImage: NetworkImage(
                                      snapshot.data!.docs[index].data()['PhotoUrl'],
                                  ),
                                ),
                                title:
                                    Text(snapshot.data!.docs[index].data()['username'],style:TextStyle(fontFamily: 'Schyler',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              })
          : StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  print(snapshot.data!.docs);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => snapshot.data!.docs[index]
                                .data()['Alumni']
                                .toString() ==
                            "ture"
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Alumni_Card_Screen(
                                            snap: snapshot.data!.docs[index]
                                                .data(),
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 5.1,
                                      blurRadius: 5.2,
                                      offset: Offset(1, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          height: height * 0.2,
                                          width: width * 0.35,
                                          imageUrl: snapshot.data!.docs[index]
                                              .data()['PhotoUrl'],
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
                                      Expanded(
                                        child: Container(
                                          height: height * 0.2,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 11),
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data!.docs[index]
                                                    .data()['jobDetails'],
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: width * 0.2,
                                                    child: Text(
                                                      'Base: ' +
                                                          snapshot
                                                              .data!.docs[index]
                                                              .data()['Batch'],
                                                      style: TextStyle(
                                                          fontFamily: 'Schyler',
                                                          fontSize: 8,
                                                          color: Colors.white),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: width * 0.2,
                                                    child: Text(
                                                      'Department: ' +
                                                          snapshot.data!
                                                                  .docs[index]
                                                                  .data()[
                                                              'department'],
                                                      style: TextStyle(
                                                          fontFamily: 'Schyler',
                                                          fontSize: 8,
                                                          color: Colors.white),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                            ),
                          )
                        : Container(),
                  );
                }
              },
            ),
    );
  }
}
