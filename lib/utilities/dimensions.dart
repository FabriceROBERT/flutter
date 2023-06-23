import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // (taille du telephone) 781/ 220 (taille du container image des restos)

  static double pageView = screenHeight / 2.44;
  static double pageViewContainer = screenHeight / 3.55;
  // (taille du telephone) 781/ 120 (taille du container blanc avec info sur les restos)
  static double pageViewTextContainer = screenHeight / 6.50;

// Hauteur dynamique
  static double height10 = screenHeight / 78.1;
  static double height15 = screenHeight / 52.06;
  static double height20 = screenHeight / 39.05;
  static double height30 = screenHeight / 26.03;
  static double height45 = screenHeight / 17.35;
  static double height70 = screenHeight / 11.15;
  static double height80 = screenHeight / 9.76;
  static double height120 = screenHeight / 9.50;

// Largeur dynamique
  static double width10 = screenHeight / 78.1;
  static double width15 = screenHeight / 52.06;
  static double width20 = screenHeight / 39.05;
  static double width30 = screenHeight / 26.03;
  static double width120 = screenHeight / 9.50;

  static double font20 = screenHeight / 39.05;
  static double font12 = screenHeight / 65.08;

  static double radius15 = screenHeight / 52.06;
  static double radius20 = screenHeight / 52.06;
  static double radius30 = screenHeight / 26.03;

  // liste view
// 533/120
  static double listViewImg = screenWidth / 4.44;
  static double listViewText = screenWidth / 3.9;
}
