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
                    BigText(text: "Gi???i thi???u"),
                    SizedBox(height: Dimensions.heigth20,),
                    Expanded(child: SingleChildScrollView(child: ExandableTextWidget(text:"Chi???u v??? l?? l??c b???n s??ng qu?? t??i t???p n???p nh???t. ??o??n thuy???n ch??? c??c b??, c??c ch??? t??? ch??? huy???n, ch??? t???nh v??? c???p b???n. C??c b?? c??c ch??? ???????c ????n con ??a ra ????n. Con l???n ????? cho m??? g??nh h??ng. Con nh??? v??i m??? chia qu??. Ti???ng c?????i n??i r???n r??ng c??? m???t kh??c s??ng. R???i ai v??? nh?? n??y. Con thuy???n neo v??o b???n ?????. ????y c??ng l?? l??c b???n tr??? ch??n tr??u l??a tr??u xu???ng t???m. B???n tr??? t???m cho tr??u, r???i b???n tr??? gi???n n?????c. Ch??ng t?? n?????c cho nhau. Ch??ng ch??i tr?? ????nh tr???n. M???t ?????a ki???m ????u ???????c tr??i b??ng tr??n. Th??? l?? ch??ng n??m b??ng cho nhau. M???t ?? ki???n ???????c c??? b???n ch???p nh???n: ch??i b??ng n?????c. Ch??ng chia l??m hai phe, chuy???n b??ng cho nhau. Phe n??o chuy???n ???????c 6 chuy???n l?? th???ng. Phe thua ph???i c??ng phe th???ng ch???y d???c con s??ng su???t t??? b???n t???m ?????n t???n g???c ??a. B???n s??ng qu?? t??i c??? r???n r??ng nh?? v???y cho ?????n l??c m???t tr???i l???n ph??a ch??n ?????i m???i c?? ch??t b??nh l???ng."))),
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
              child: BigText(text: "\$10 | Th??m v??o gi???",color: Colors.white,),
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
