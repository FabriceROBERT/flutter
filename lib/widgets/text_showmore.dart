import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/utilities/colors.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/small_text.dart';

class Text_Show extends StatefulWidget {
  final String text;
  const Text_Show({super.key, required this.text});

  @override
  State<Text_Show> createState() => _Text_ShowState();
}

class _Text_ShowState extends State<Text_Show> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 4;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              size: Dimensions.font20,
              color: AppColors.mainColor2,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                    size: Dimensions.font20,
                    text: hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(children: [
                    SmallText(
                      text: "voir plus",
                      color: AppColors.mainColor2,
                    ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.mainColor2,
                    )
                  ]),
                )
              ],
            ),
    );
  }
}
