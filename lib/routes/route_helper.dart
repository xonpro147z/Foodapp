
import 'package:get/get.dart';
import 'package:untitled/pages/cart/cart_page.dart';
import 'package:untitled/pages/food/popular_food_detail.dart';
import 'package:untitled/pages/food/recommend_food_detail.dart';
import 'package:untitled/pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood ="/recommended-food";
  static const String cartPage="/cart-page";
  
  static String getInitial()=>'$initial';
  static String getPopularFood() =>'$popularFood';
  static String getRecommendedFood(int pageId) =>'$recommendedFood?pageId=$pageId';
  static String getCartPage()=>'$cartPage';
  
   static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>MainFoodPage()),

     GetPage(name: popularFood, page: (){ //print(" thong tin thuc awn ddc goi len ");
       return PopularFoodDetail();
     },
       transition: Transition.fadeIn,
     ),
     GetPage(name: cartPage, page: (){
       return CartPage();
     },
     transition: Transition.fadeIn,
     ),
     GetPage(name: recommendedFood, page: (){ //print(" thong tin thuc awn ddc goi len ");
       return RecommendedFoodDetail();
     },
       transition: Transition.fadeIn,
     ),
     //8:05;16
   ];
}