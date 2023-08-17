import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop_test/Screen/Home/Home_screen.dart';
import 'package:shop_test/Screen/Shop/Shop_Screen.dart';

import 'Bag/Bag_Screen.dart';
import 'Profile/Profile_Screen.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(selectedIndex),
      bottomNavigationBar: Container(
        height: 80,
        decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 15.0),
          child: GNav(
            selectedIndex: 0,
            activeColor: const Color(0xFFe08243),
            iconSize: 30,
            gap: 12,
            tabBackgroundColor:const Color(0xFFe08243).withOpacity(0.3),
            padding:const EdgeInsets.all(10),
            tabs:const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Shop',
                ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: 'Bag',
                ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
                ),
            ],
            onTabChange: (Index) {
              setState(() {
                selectedIndex = Index;
              });
            },
            ),
        ),
      ),
    );
  }
  Widget buildPage(int Index){
    switch (Index) {
      case 0:
        return HomeScreen();
      case 1:
        return ShopScreen();
      case 2:
        return BagScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}
