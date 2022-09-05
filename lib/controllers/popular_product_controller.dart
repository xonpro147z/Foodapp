import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/cart_controller.dart';
import 'package:untitled/models/products_model.dart';
import 'package:untitled/utils/color.dart';
import '../data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;


  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("lay san pham");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    }
    else {

    }
  }

    void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      //print("số hạng mục"+ _quantity.toString());
    }
    else {
      _quantity = checkQuantity(_quantity - 1);
      //print("giam" + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Số mặt hàng", "Bạn không thể giảm nhiều hơn!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;

    }
    else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Số mặt hàng", "Bạn không thể thêm nhiều hơn!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }
    else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("tồn tại hay không" + exist.toString());
    //get from storeage _incartItem=3
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("So luong hang trong gio la " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("id la " + value.id.toString() + " so luong la " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel>get getItems{
    return _cart.getItems;
  }
}
