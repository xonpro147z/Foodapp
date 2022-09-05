import 'package:get/get.dart';
import 'package:untitled/controllers/cart_controller.dart';
import 'package:untitled/controllers/popular_product_controller.dart';
import 'package:untitled/controllers/recommended_product_controller.dart';
import 'package:untitled/data/api_client.dart';
import 'package:untitled/data/repository/popular_product_repo.dart';
import 'package:untitled/data/repository/recommended_product_repo.dart';
import 'package:untitled/utils/app_constants.dart';
import '../data/repository/cart_repo.dart';
Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> CartRepo());

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
