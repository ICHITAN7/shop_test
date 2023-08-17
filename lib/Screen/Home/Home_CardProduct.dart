import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Controller/main_controller.dart';
class cardProducts extends StatelessWidget {
  const cardProducts({
    super.key, required this.title,
  });
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
     // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style:TextStyle(color: Colors.black.withOpacity(1),fontSize: 30,fontWeight: FontWeight.bold),),
              Text('See all',style:TextStyle(color: Colors.black.withOpacity(1),fontSize: 20))
            ],
          ),
          GetBuilder<ProductController>(
            builder: (controller) {
              if(controller.isLoading){return const Center(child: CircularProgressIndicator(),);}
              if(controller.products.isEmpty){return const Center(child: Text('None data'));}
             return SizedBox(
               height: 270,
               width: double.maxFinite,
               child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding:const EdgeInsets.all(0),
                    itemCount:5,
                    itemBuilder:(context, index) {
                    final product = controller.products[index];
                    String myString = '${product.title}';
                    List<String> words = myString.split(" "); // Split the string into words using space as the delimiter
                    String firstWord = words.first;
                     return Stack(
                       children: [
                            Padding(
                               padding: const EdgeInsets.only(top:10,right: 10),
                               child: Container(
                                 height:250,
                                 width:150,
                                 decoration: BoxDecoration(
                                   color:Colors.white.withOpacity(0.5),
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Container(
                                       height:200,
                                       width:150,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         image: DecorationImage(
                                           image: NetworkImage(product.image!),
                                           fit: BoxFit.cover,
                                         ),
                                       ),
                                     ),
                                     const SizedBox(height: 5,),
                                     Text('  $firstWord',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                     Text('   ${product.price.toStringAsFixed(2)}\$',style:const TextStyle(color: Colors.red),)
                                   ],
                                 ),
                               ),
                             ),
                            Positioned(
                              top: 15,
                              left: 5,
                                child: Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                                    color: const Color(0xFFe08243).withOpacity(0.8)
                                  ),
                                )
                                ),
                              const Positioned(
                                top: 21,
                                left: 10,
                                child: Text('-20%',style: TextStyle(color: Colors.white),))
                       ],
                     );
                   },
               ),
             );
            },
          ),
        ],
      ),
    );
  }
}
