// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utilities/dimensions.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 15,
      this.height = 1.2
      // "..." Lorsque le texte est trop long, cela se  nomme elipsis
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: Dimensions.font20,
          fontFamily: 'Roboto',
          height: height),
    );
  }
}
