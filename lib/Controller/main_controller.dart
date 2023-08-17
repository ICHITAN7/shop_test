import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_test/Model/fashion_Data.dart';

class ProductController extends GetxController {
  final Helper _api = Helper();
  bool isLoading = false;
  List<Product_Fashion> productResModel = [];
  List<Product_Fashion> get products => productResModel;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future refreshProduct() async {
    getProduct();
    return true;
  }

  void getProduct() async {
    try {
      isLoading = true;
      update();
      final product = await _api.getProduct();
      if (product.isNotEmpty) {
        productResModel = product;
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }
}
class Helper {
  final dio = Dio();

  Future<List<Product_Fashion>> getProduct() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');
      return (response.data as List)
          .map((e) => Product_Fashion.fromJson(e))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}