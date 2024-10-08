<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:d36a48bdc08b54c9233482da0ffcfc1c255267541fd87fa734aa440e59da0757
size 1195
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intra_media/Widget_ForGloblaUse/outline_borderss.dart';

class Text_form_second extends StatefulWidget {
  TextEditingController storingdata = TextEditingController();
  final hint_text_provide;
  Text_form_second(
      {super.key, required this.storingdata, required this.hint_text_provide});
  @override
  State<Text_form_second> createState() => _Text_form_fieldState();
}


class _Text_form_fieldState extends State<Text_form_second> {
  // void dispose() {
  //   super.dispose();
  //   widget.storingdata.dispose();
  //   widget.hint_text_provide.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
      controller: widget.storingdata,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          hintText: widget.hint_text_provide,
          focusedBorder: forfocusing_se(),
          enabledBorder: for_enable_focusing_se()),
      maxLines: 50,
    );
  }
}
>>>>>>> master
