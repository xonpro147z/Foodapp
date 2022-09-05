import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/home/main_food_page.dart';
import 'package:untitled/utils/color.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/widget/app_column.dart';
import 'package:untitled/widget/app_icon.dart';
import 'package:untitled/widget/big_text.dart';
import 'package:untitled/widget/icon_and_text_widget.dart';

import '../../widget/exandable_text_widget.dart';
import '../../widget/small_text.dart';
class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left:0,
              right: 0,
              child: Container(
              width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "image/food2.webp"
                    )
                  )
                ),
          )),
          //icon widgets
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainFoodPage());
                    },
                    child:
                      AppIcon(icon: Icons.arrow_back)),
                      AppIcon(icon: Icons.shopping_cart_outlined),

                ],

          )),
          //introduction of food
          Positioned(
              left:0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.heigth20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                       ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chines Side"),
                    SizedBox(height: Dimensions.heigth20,),
                    BigText(text: "Giới thiệu"),
                    SizedBox(height: Dimensions.heigth20,),
                    Expanded(child: SingleChildScrollView(child: ExandableTextWidget(text:"Chiều về là lúc bến sông quê tôi tấp nập nhất. Đoàn thuyền chở các bà, các chị từ chợ huyện, chợ tỉnh về cập bến. Các bà các chị được đàn con ùa ra đón. Con lớn đỡ cho mẹ gánh hàng. Con nhỏ vòi mẹ chia quà. Tiếng cười nói rộn ràng cả một khúc sông. Rồi ai về nhà nây. Con thuyền neo vào bến đỗ. Đây cũng là lúc bọn trẻ chăn trâu lùa trâu xuống tắm. Bọn trẻ tắm cho trâu, rồi bọn trẻ giỡn nước. Chúng té nước cho nhau. Chúng chơi trò đánh trận. Một đứa kiếm đâu được trái bóng tròn. Thế là chúng ném bóng cho nhau. Một ý kiến được cả bọn chấp nhận: chơi bóng nước. Chúng chia làm hai phe, chuyền bóng cho nhau. Phe nào chuyền được 6 chuyền là thắng. Phe thua phải cõng phe thắng chạy dọc con sông suốt từ bến tắm đến tận gốc đa. Bến sông quê tôi cứ rộn ràng như vậy cho đến lúc mặt trời lặn phía chân ười mới có chút bình lặng."))),
                  ],
                )



                ),
              ),
          //expandable text widget

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30,left: Dimensions.width20,right:Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.heigth20,bottom: Dimensions.heigth20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                    children: [
                      Icon(Icons.remove,color: AppColors.signColor),
                      SizedBox(width: Dimensions.width20/2),
                      BigText(text:"0"),
                      SizedBox(width: Dimensions.width20/2),
                      Icon(Icons.add,color: AppColors.signColor)
                    ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.heigth20,bottom: Dimensions.heigth20,left: Dimensions.width20,right:Dimensions.width20),
              child: BigText(text: "\$10 | Thêm vào giỏ",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
