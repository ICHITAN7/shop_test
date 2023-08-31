import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/Screen/Shop/Constant/ProductsCard.dart';
import '../../Controller/ProductController.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shopping',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Colors.white.withOpacity(0.7),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.black,
              iconSize: 28,
            )
          ],
          bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Color(0xFFe08243),
              tabs: [
                Tab(
                  text: 'Men',
                ),
                Tab(
                  text: 'Women',
                ),
                Tab(
                  text: 'Boy',
                ),
                Tab(
                  text: 'Girl',
                ),
                Tab(
                  text: 'Baby',
                ),
              ]),
        ),
        body:TabBarView(
          children: [
            categoryTab(condition: 'Men'),
            categoryTab(condition: 'Women'),
            categoryTab(condition: 'Boy'),
            categoryTab(condition: 'Girl'),
            categoryTab(condition: 'Baby'),
          ],
        )
      ),
    );
  }

  Padding categoryTab({required String condition}) {
    return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GetBuilder<ProductsController>(
                builder: (controller){
                  final List<dynamic> products = controller.productsModel.data!;
                  final List<dynamic> filteredProducts = products.where((product) => product.category == condition).toList();
                  final count = filteredProducts.length;
                  return ListView.builder(
                    itemCount: count,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductCard(model: product.model.toString(), brand: product.brand.toString(), price:product.price!.toInt() , dis:product.discount!.toInt(), description: product.detail.toString(), imageUrl:product.proImage.toString());
                    },
                  );
                }
            ),
          );
  }
}