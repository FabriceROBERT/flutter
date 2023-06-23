import 'package:flutter/material.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/small_text.dart';
import '../utilities/colors.dart';
import 'TextIconWidget.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Aligne le titre du resto au centre
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BigText(text: text),
        // Sizebox sert de margin
        SizedBox(height: Dimensions.height10),
        // Row Correspond à l'etoile et
        Row(
          children: [
            // On utilise Wrap pour chaque etoile comme un foreach
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            // Espacer les items issus du Row
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "commentaires")
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconText(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconText(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
