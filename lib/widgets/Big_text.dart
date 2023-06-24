// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utilities/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 20,
      // "..." Lorsque le texte est trop long, cela se  nomme elipsis
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size==0?Dimensions.font26:size,
          fontFamily: 'Roboto'),
    );
  }
}
