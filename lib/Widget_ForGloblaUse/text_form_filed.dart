import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intra_media/Widget_ForGloblaUse/outline_borderss.dart';

class Text_form_fields extends StatefulWidget {
  TextEditingController storingdata = TextEditingController();
  final hint_text_provide;
  Icon icons_provide;
  final Color;
  final maxline;
  final obsecure;
  Text_form_fields({
    super.key,
    required this.storingdata,
    required this.hint_text_provide,
    required this.icons_provide,
    this.Color = Colors.black,
    this.maxline = null,
    this.obsecure=false,
  });
  @override
  State<Text_form_fields> createState() => _Text_form_fieldState();
}

class _Text_form_fieldState extends State<Text_form_fields> {
  // void dispose() {
  //   super.dispose();
  //   widget.storingdata.dispose();
  //   widget.hint_text_provide.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      maxLines: widget.maxline,
      style: TextStyle(color: widget.Color,fontFamily: 'Schyler'),
      controller: widget.storingdata,
      decoration: InputDecoration(
          hintText: widget.hint_text_provide,
          hintStyle: TextStyle(
            color: widget.Color,
          ),
          prefixIcon: widget.icons_provide,
          focusedBorder: forfocusing(),
          enabledBorder: for_enable_focusing()),
    );
  }
}
