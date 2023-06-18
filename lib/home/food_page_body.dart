import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/colors.dart';
import 'package:foodapp/widgets/Big_text.dart';
import 'package:foodapp/widgets/Small_text.dart';
import 'package:foodapp/widgets/TextIconWidget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

// Creation du stfl widget
class _FoodPageBodyState extends State<FoodPageBody> {
  //Voir le prochain slide
  PageController pageController = PageController(viewportFraction: 0.85);
  // variable qui stocke la valeur de la page actuelle
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
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
        ),
        // Points, position actuelle
        DotsIndicator(
          dotsCount: 5,
          // _currPageValue est double _currPageValue.toInt() met la variable en int
          position: _currPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);

      // var currTrans = matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    // Empiler les Widgets
    // Le Container ci-dessous prendra respectivement sa hauteur respective
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            // Hauteur de l'image
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
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
            // 2eme Image
            child: Container(
              // Hauteur de la 2eme image
              height: 120,
              // Retrecir l'image
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              // Style
              decoration: BoxDecoration(
                  // Bordure arrondis
                  borderRadius: BorderRadius.circular(30),
                  // Couleurs
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              //Le Container va servir de padding
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  // Aligne le titre du resto au centre
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(text: "Bread & Meat"),
                    // Sizebox sert de margin
                    const SizedBox(
                      height: 10,
                    ),
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
                    const SizedBox(
                      height: 20,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
