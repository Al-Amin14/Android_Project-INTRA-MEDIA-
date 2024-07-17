import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class Alumni_Card_Screen extends StatefulWidget {
  final snap;
  const Alumni_Card_Screen({super.key,required this.snap});

  @override
  State<Alumni_Card_Screen> createState() => _Alumni_Card_screeSState();
}

class _Alumni_Card_screeSState extends State<Alumni_Card_Screen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return  Scaffold(
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
                imageUrl: widget.snap['PhotoUrl'],
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
                      widget.snap['fullname'],
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
                        width: width * 0.5,
                            child: Text(
                                'Batch: '+widget.snap['Batch'],
                              style: TextStyle(
                                  fontFamily: 'Schyler',
                                  fontSize: 10,
                                  color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        Spacer(),
                        Container(
                        width: width * 0.3,
                        child: Text(
                          'Department: '+
                          widget.snap['department'],
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
                      widget.snap['jobDetails'],
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child:Link(
                      uri: Uri.parse(widget.snap['LinkedInId'].toString()),
                      target: LinkTarget.blank,
                      builder: (
                        BuildContext context, followLink) {
                        return ElevatedButton(
                            onPressed: followLink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'LinkedIn: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),
                                  textAlign:TextAlign.center,
                                ),
                                FaIcon(FontAwesomeIcons.linkedin,size: 40,),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 162, 158, 158),
                            ),
                            );
                      },
                                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child:Link(
                      uri: Uri.parse(widget.snap['github'].toString()),
                      target: LinkTarget.blank,
                      builder: (
                        BuildContext context, followLink) {
                        return ElevatedButton(
                            onPressed: followLink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'GitHub: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),
                                  textAlign:TextAlign.center,
                                ),
                                FaIcon(FontAwesomeIcons.github,size: 40,),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 162, 158, 158),
                            ),
                            );
                      },
                                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: width*0.9,
                        height: height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 162, 158, 158),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              'Contuct :'+widget.snap['Contactemail'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),
                              textAlign:TextAlign.center,
                            ),
                          ],
                        ),),
                    )
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
