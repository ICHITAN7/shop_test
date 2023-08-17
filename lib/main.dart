import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/Screen/MainPage.dart';
void main() {
  runApp(const MyShopApp());
}
class MyShopApp extends StatelessWidget {
  const MyShopApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MainPage(),
    );
  }
}