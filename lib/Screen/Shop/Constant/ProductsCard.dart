import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/Screen/Shop/Constant/DetailScreen.dart';
class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.model, required this.brand, required this.price, required this.dis, required this.description, required this.imageUrl, });
  final String model;
  final String brand;
  final int price;
  final int dis;
  final String description;
  final String imageUrl;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool bagIcon = true;
  void _bagIcon(){
    setState(() {
      bagIcon =! bagIcon;
    });
  }
  void _removeFromBag(){
    Get.snackbar('Message', 'Remove from bag');
  }
  @override
  Widget build(BuildContext context) {
    final fullPrice = (widget.price)*(100-widget.dis)/100 ;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: const Color(0xFFe08243).withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: const Color(0xFFe08243).withOpacity(0.3),
                  offset: const Offset(0, 4),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image(
                  image: NetworkImage('http://127.0.0.1:8000/proimages/${widget.imageUrl}'),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(
                        widget.model,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.brand,
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    ),
                    Text(
                      '$fullPrice \$',
                      style: TextStyle(
                          color: Colors.red.withOpacity(1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: (){
                        _bagIcon();
                        bagIcon?_removeFromBag():
                        Get.to(()=>DetailScreen(urlImage:widget.imageUrl,name: widget.model,description: widget.description,price: widget.price,fullPrice: fullPrice,discount: widget.dis,brand: widget.brand,));
                      },
                      icon: bagIcon?const Icon(Icons.shopping_bag_outlined):const Icon(Icons.shopping_bag)
                  ),
                ],
              )
            ],
          )),
    );
  }
}