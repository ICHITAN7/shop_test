import 'package:get/get.dart';
import 'package:shop_test/Controller/api_helper.dart';
import 'package:shop_test/Model/ProductsModel.dart';

class ProductsController extends GetxController {
  ApiHelper helper = ApiHelper();
  bool isLoading = false;
  bool bagIcon = true;
  ProductsModel productsModel = ProductsModel();
  ProductsController(){
    getAllProducts();
  }
  void getAllProducts() async {
    try{
      isLoading = true;
      update();
      final products = await helper.showAllProducts();
      productsModel = products;
      isLoading = false;
      update();
    }catch(e){
      isLoading = false;
      update();
      Get.snackbar('ErrorCon', e.toString());
    }
  }
  void addToCard()async{

  }
}