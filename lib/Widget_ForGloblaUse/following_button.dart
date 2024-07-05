import 'package:flutter/material.dart';

class Follow_button extends StatelessWidget {
  Color background_Color;
  Color border_Color;
  final txt;
  Follow_button(
      {super.key,
      required this.txt,
      required this.border_Color,
      required this.background_Color,
      });

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width*1;
    final height=MediaQuery.sizeOf(context).height*1;
    return Container(
      padding: EdgeInsets.all(20),
      child: TextButton(
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          height: height*0.05,
          width: width*0.5,
          decoration: BoxDecoration(
            color: background_Color,
            border: Border.all(
              color: border_Color,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text(
            txt,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
      ),
    );
  }
}
