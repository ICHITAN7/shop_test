import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/Controller/main_controller.dart';
import 'package:shop_test/Screen/Home/Home_Header.dart';
import 'Home_CardProduct.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: const [
             main_header(),
             cardProducts(title:'New Arrival',),
             cardProducts(title:'Super Sale',)
          ],
        ),
      ),
    );
  }
}