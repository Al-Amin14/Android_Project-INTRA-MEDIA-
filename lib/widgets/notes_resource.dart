<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:5ecdae77037151b4968096b1549f4914c615c0f1b81811363496d277a5096d63
size 4330
=======
// import 'dart:io';

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart'

class Notes_resourse extends StatefulWidget {
  const Notes_resourse({super.key});
  @override
  State<Notes_resourse> createState() => _Notes_resourseState();
}

class _Notes_resourseState extends State<Notes_resourse> {
  final semester = [
    '1st year 1st semester',
    '1st year 2nd semester',
    '2nd year 1st semester',
    '2nd year 2nd semester',
    '3rd year 1st semester',
    '3rd year 2nd semester',
    'Second last semester',
    'last semester'
  ];
  var semester_link_mapping = {
    '1st year 1st semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
    '1st year 2nd semester':
        'https://drive.google.com/drive/folders/1_XxiYIeinrxPwOOGRasOK9m8FEu_iXg1',
    '2nd year 1st semester':
        'https://drive.google.com/drive/folders/1qomc9V5zA3FetfpMYo1QSx_fXgmD0EfU?fbclid=IwAR3JDGsWt4wn3lhM44yUQg7ZghlO8PTXj5E-rtot4A-vM4bWAU3okfdh-1E',
    '2nd year 2nd semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
    '3rd year 1st semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
    '3rd year 2nd semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
    ' semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
    'Second last semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
    'last semester':
        'https://drive.google.com/drive/u/0/folders/1FHprR8v1gfhvolnTbgxp1T2BGploHvSp',
  };
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 102, 98, 98),
              spreadRadius: 12.5,
              blurRadius: 7,
              offset: Offset(1, 1)),
        ],
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 99, 98, 98),
          Color.fromARGB(255, 0, 0, 0),
        ], begin: FractionalOffset(0.0, 0.0), end: FractionalOffset(1.0, 1.0)),
      ),
      child: ListView(
          itemExtent: 100,
          children: semester
              .map((e) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 3,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        child: Link(
                          uri: Uri.parse(semester_link_mapping[e]!),
                          target: LinkTarget.blank,
                          builder: (BuildContext context, followLink) {
                            return ElevatedButton(
                              onPressed: followLink,
                              child: Text(
                                '${e}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 6, 11, 6),
                                    fontFamily: 'Schyler'),
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 158, 161, 158),
                              ),
                            );
                          },
                        )),
                  ))
              .toList()),
    )));
  }
}
>>>>>>> master
