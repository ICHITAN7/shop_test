import'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:shop_test/Model/ProductsModel.dart';
import 'package:shop_test/Model/UserModel.dart';
import 'package:shop_test/Screen/Profile/Login_screen.dart';
class ApiHelper {
  final dio = Dio();
  String mainUrl = 'http://127.0.0.1:8000/api';
  GetStorage storage = GetStorage();
  Future<String> register({required String name, required String email, required String password, required String position, required File profile,}) async
  {
    var formdata = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'position': position,
      'url_image': await MultipartFile.fromFile(profile.path)
    });
    Response response = await dio.post(
        "$mainUrl/register",
        data: formdata,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
          'accept': 'application/json'
        })
    );
    if (response.statusCode == 200) {
      return 'Register Success please go to login again.';
    }
    else {
      return 'Failed to register';
    }
  }
  Future<dynamic> login({required String email, required String password,}) async
  {
    var formdata = FormData.fromMap({
      'email': email,
      'password': password,
    });
    Response response = await dio.post(
        "$mainUrl/login",
        data: formdata,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
          'accept': 'application/json'
        })
    );
    if (response.statusCode == 200) {
      print(response.data['access_token']);
      return response.data['access_token'];
    }
    else {
      return 'Failed to Login';
    }
  }
  Future<UserModel> userHelper ({required String token}) async
  {
    try{
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response user = await dio.get('$mainUrl/user');
      if (user.statusCode == 200) {
        return UserModel.fromJson(user.data);
      }
      else if (user.statusCode ==201){
        Get.off(()=>LoginScreeen());
        print('201');
      }
      else {
        throw Exception ('Failed to Login');
      }
    }
    catch(e) {
      print('Catch : $e');
      Get.off(()=> LoginScreeen());
    }
    throw Exception ('Failed to Login');
  }
  Future<ProductsModel> showAllProducts() async
  {
    try{
    Response response = await dio.get('$mainUrl/showPro');
    if(response.statusCode == 200){
      return ProductsModel.fromJson(response.data);
    }
    else{
      Get.snackbar('ErrorHelper',response.statusMessage.toString());
    }
    }catch(e){
      Get.snackbar("ErrorHelper", e.toString());
    }
    throw Exception('Failed to get data in Helper');
  }
}