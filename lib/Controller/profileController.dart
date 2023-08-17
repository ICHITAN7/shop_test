import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Dio dio = Dio();
  String maiUrl = 'http://127.0.0.1:8000/api';

}