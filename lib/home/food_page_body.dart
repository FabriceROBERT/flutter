import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

// Creation du stfl widget
class _FoodPageBodyState extends State<FoodPageBody> {
  //Voir le prochain slide
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      // Hauteur du container contenant l'image
      height: 320,
      child: PageView.builder(
          controller: pageController,
          // Contient 5 images
          itemCount: 5,
          itemBuilder: (context, position) {
            // Widget correspondant à l'image
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    // Empiler les Widgets
    // Le Container ci-dessous prendra respectivement sa hauteur respective
    return Stack(
      children: [
        Container(
          // Hauteur de l'image
          height: 220,
          margin: const EdgeInsets.only(left: 5, right: 5),
          // Style
          decoration: BoxDecoration(
            // Bordure arrondis
            borderRadius: BorderRadius.circular(30),
            // Couleurs
            color: index.isEven
                ? const Color(0xFF69c5df)
                : const Color(0xFF9294cc),
            image: const DecorationImage(
              // Remplir l'image du container
              fit: BoxFit.cover,
              image: AssetImage("assets/Image/food3.jpeg"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // Hauteur de la 2eme image
            height: 160,
            // Retrecir l'image
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            // Style
            decoration: BoxDecoration(
                // Bordure arrondis
                borderRadius: BorderRadius.circular(30),
                // Couleurs
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
