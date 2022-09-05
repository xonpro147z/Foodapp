import 'package:flutter/material.dart';
import 'package:untitled/pages/home/food_page_body.dart';
import 'package:untitled/utils/dimensions.dart';

import '../../utils/color.dart';
import '../../widget/big_text.dart';
import '../../widget/small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.heigth15),
                  padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Thành phố Hồ Chí Minh",
                          color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Quận 1", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search_sharp, color: Colors.white,
                          size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Dimensions.radius15),
                        color: AppColors.mainColor,

                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
         Expanded(child: SingleChildScrollView(
           child:  FoodPageBody(),
         ))
        ],
      ),
    );
  }
}






