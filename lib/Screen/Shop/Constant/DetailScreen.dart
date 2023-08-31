import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.urlImage, required this.name, required this.description, required this.price, this.fullPrice, required this.discount, required this.brand});
  final String urlImage;
  final String name;
  final String description;
  final int price;
  final int discount;
  final String brand;
  final fullPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Colors.white.withOpacity(0.7),
        iconTheme: IconThemeData(color: Colors.black.withOpacity(1)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            color: Colors.black,
            iconSize: 28,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: NetworkImage('http://127.0.0.1:8000/proimages/$urlImage'),fit: BoxFit.cover,width: double.maxFinite,),
          const SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Size"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  MaterialButton(onPressed: (){},
                    child:const Text("S"),),
                  MaterialButton(onPressed: (){},
                    child:const Text("M"),),
                  MaterialButton(onPressed: (){},
                    child:const Text("L"),),
                  MaterialButton(onPressed: (){},
                    child:const Text("XL"),),
                ],),
                const SizedBox(height: 5,),
                Text(brand,style:const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    const Spacer(),
                    Text('${fullPrice.toString()}\$',style:const TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(width: 5,),
                    Text('${price.toString()}\$',style:const TextStyle(decoration: TextDecoration.lineThrough,fontSize: 15),),
                    const SizedBox(width: 5,),
                    Text('-${discount.toString()}%',style: const TextStyle(color: Colors.red),),
                  ],
                ),
                const SizedBox(height: 5,),
                Text(description,style: Theme.of(context).textTheme.bodySmall,),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){}, child:Row(children:const [
                      Icon(Icons.shopping_cart_checkout_outlined),
                      Text('Buy Now!'),
                    ],)),
                    const Spacer(),
                    ElevatedButton(onPressed: (){}, child:Row(children:const [
                      Icon(Icons.shopping_bag_outlined),
                      Text('Add to bag'),
                    ],)),
                  ],
                )
              ],
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
