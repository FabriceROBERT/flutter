import 'package:flutter/material.dart';
import 'package:foodapp/pages/home/food_page_body.dart';
import 'package:foodapp/utilities/dimensions.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/small_text.dart';
import '../../utilities/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is ${MediaQuery.of(context).size.height.toString()}");
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height70, bottom: Dimensions.height15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "France",
                          color: AppColors.mainColor2,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Paris",
                              color: Colors.black,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor2,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: Dimensions.height20,
                          )),
                    ),
                  ]),
            ),
          ),
          // Body
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
