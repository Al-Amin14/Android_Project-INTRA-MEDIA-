import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intra_media/Utils/utils.dart';


forfocusing() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 68, 66, 66),
        width: 3,
      ));
}

forfocusing_se() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 255, 253, 253),
        width: 3,
      ));
}

for_enable_focusing() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 68, 66, 66),
        width: 3,
      ));
}

for_enable_focusing_se() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 102, 157, 122),
        width: 3,
      ));
}
