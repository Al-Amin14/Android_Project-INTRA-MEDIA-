<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:d97890a6f3a9999ec10792e857833c7a67ac3c89112c18070473676b5735bb1a
size 1196
=======
// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:share_plus/src/share_plus_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FirebaseFirestoreWeb.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseStorageWeb.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  SharePlusWebPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
>>>>>>> master
