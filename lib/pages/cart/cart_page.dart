import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/cart_controller.dart';
import 'package:untitled/pages/food/popular_food_detail.dart';
import 'package:untitled/pages/home/main_food_page.dart';
import 'package:untitled/routes/route_helper.dart';
import 'package:untitled/utils/app_constants.dart';
import 'package:untitled/utils/color.dart';
import 'package:untitled/utils/dimensions.dart';
import 'package:untitled/widget/app_icon.dart';
import 'package:untitled/widget/big_text.dart';
import 'package:untitled/widget/small_text.dart';
import  'package:get/get.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.heigth20, //*3//
            left: Dimensions.width20,
              right: Dimensions.width20,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){

                },
                child: AppIcon(icon: Icons.arrow_back,
                iconColor :Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
                ),
              ),
              SizedBox(width: Dimensions.width20*5,),///tao ra mo khoang cach 3 icon
              GestureDetector(
                onTap: (){
                  print("an duoc");
                 Get.toNamed(RouteHelper.getInitial());
                },
                child: AppIcon(icon: Icons.home_outlined,
                  iconColor :Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ),
              AppIcon(icon: Icons.shopping_cart,
                iconColor :Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              ),
            ],
      )
          ),
          Positioned(
          top: Dimensions.heigth20*5,
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: 0,
          child:Container(
            margin: EdgeInsets.only(top:Dimensions.heigth15),
        //color: Colors.red,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(builder: (cartController){
                var _cartList = cartController.getItems;
                return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (_,index){
                      return Container(
                        width:double.maxFinite ,
                        height: Dimensions.heigth20*5,
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.heigth20*5,
                              height: Dimensions.heigth20 *5,
                              margin: EdgeInsets.only(bottom: Dimensions.heigth10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      AppConstants.BASE_URL+ AppConstants.UPLOAD_URL + cartController.getItems[index].img!
                                    )
                                  ),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(width: Dimensions.width10,),
                            Expanded(child: Container(
                              height: Dimensions.heigth20*5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(text: cartController.getItems[index].name!,color: Colors.black54,),
                                  SmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(text:cartController.getItems[index].price.toString(),color: Colors.redAccent,),
                                      Container(
                                        padding: EdgeInsets.only(top:Dimensions.heigth10,bottom: Dimensions.heigth10,left: Dimensions.width10,right: Dimensions.width10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                                            color: Colors.white
                                        ),
                                        child:Row(
                                          children: [
                                            GestureDetector(
                                                onTap: (){
                                                  //popularProduct.setQuantity(false  );
                                                },
                                                child: Icon(Icons.remove,color: AppColors.signColor,)),
                                            SizedBox(width: Dimensions.width10/2),
                                            BigText(text: _cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                                            SizedBox(width: Dimensions.width10/2),
                                            GestureDetector(
                                                onTap: (){
                                                  //popularProduct.setQuantity(true);
                                                },
                                                child: Icon(Icons.add,color: AppColors.signColor,)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],

                              ),
                            ))
                          ],
                        ),
                      );
                    });
              },)
            ),

          ))
        ],
      ),
    );
  }
}
