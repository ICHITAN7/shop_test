import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/Screen/MainPage.dart';
void main() {
  runApp(const MyShopApp());
}
class MyShopApp extends StatefulWidget {
  const MyShopApp({super.key});

  @override
  State<MyShopApp> createState() => _MyShopAppState();
}

class _MyShopAppState extends State<MyShopApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:const Color(0xFFD1C2C2),
        primaryColor:const Color(0xFFF9943B),
        textTheme: TextTheme(
          bodyLarge:const TextStyle(color: Colors.black,fontSize: 50,fontFamily: 'NotoSerif_bold'),
          bodyMedium :const TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'NotoSerif',),
          displayMedium :const TextStyle(color: Colors.black,fontSize: 30,fontFamily: 'NotoSerif',fontWeight: FontWeight.bold),
          bodySmall : TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 15,fontFamily: 'NotoSerif',),
        ),
      ),
      home: const MainPage(),
    );
  }
}