import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utilities/colors.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/app_column.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/small_text.dart';

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
  final double _height = Dimensions.pageViewTextContainer;

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
        // Slider section
        Container(
          // color: Colors.redAccent,
          // Hauteur du container contenant l'image
          height: Dimensions.pageView,
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
        ),
        // "Populaire" texte
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            // aligner vers le bas
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Les Plus Populaires",
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food Pairing",
                  color: Colors.black26,
                ),
              )
            ],
          ),
        ),

        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height20),
                child: Row(
                  children: [
                    // Image Section
                    Container(
                      width: Dimensions.listViewImg,
                      height: Dimensions.listViewImg,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        // color: Colors.redAccent,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/Image/food12.jpg"),
                        ),
                      ),
                    ),
                    // Text Container
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewImg,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(text: "Salade César"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(
                                    text:
                                        "La salade César est une recette de cuisine de salade composée de la cuisine américaine")
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
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
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.height10, right: Dimensions.height10),
            // Style
            decoration: BoxDecoration(
              // Bordure arrondis
              borderRadius: BorderRadius.circular(Dimensions.radius30),
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
              height: Dimensions.pageViewTextContainer,
              // Retrecir l'image
              margin: EdgeInsets.only(
                  left: 20, right: 20, bottom: Dimensions.width30),
              // Style
              decoration: BoxDecoration(
                  // Bordure arrondis
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
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
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: const AppColumn(text: "Salade César",)),
            ),
          ),
        ],
      ),
    );
  }
}
