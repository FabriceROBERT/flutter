import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // (taille du telephone) 781/ 220 (taille du container image des restos)

  static double pageView = screenHeight / 2.44;
  static double pageViewContainer = screenHeight / 3.55;
  // (taille du telephone) 781/ 120 (taille du container blanc avec info sur les restos)
  static double pageViewTextContainer = screenHeight / 6.50;

  static double height10 = screenHeight / 78.1;
  static double height20 = screenHeight / 39.05;
  static double height15 = screenHeight / 52.06;

  static double font20 = screenHeight / 39.05;
  static double font12 = screenHeight / 65.08;
}
