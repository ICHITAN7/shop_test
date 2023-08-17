import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 130,
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
                      child: GestureDetector(
                        onTap: (){Catagories();},
                        child: Image(
                          image: NetworkImage('https://www.stryx.com/cdn/shop/articles/man-looking-attractive.jpg?v=1666662774'),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 130,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('Men',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 130,
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
                      child: GestureDetector(
                        onTap: (){Catagories();},
                        child: Image(
                          image: NetworkImage('https://www.stryx.com/cdn/shop/articles/man-looking-attractive.jpg?v=1666662774'),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 130,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('Men',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    ],
                )),
          ),
        ],
      ),
    );
  ;
  }
}

class Catagories extends StatelessWidget {
  const Catagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Men',
            style: TextStyle(color: Colors.black, fontSize: 23),
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
                  text: 'New',
                ),
                Tab(
                  text: 'Shirt',
                ),
                Tab(
                  text: 'Pants',
                ),
                Tab(
                  text: 'Shoes',
                ),
                Tab(
                  text: 'Accessories',
                ),
              ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Categories_Card(
                      title: 'New',
                      imageUrl:
                          'https://img.freepik.com/free-photo/beautiful-casual-men-fashion-clothes-set_1203-7836.jpg?size=626&ext=jpg',
                    ),
                    Categories_Card(
                      title: 'Clothes',
                      imageUrl:
                          'https://img.freepik.com/free-photo/white-shirt_1339-6377.jpg?size=626&ext=jpg',
                    ),
                  ],
                )),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Categories_Card(
                    title: 'New',
                    imageUrl:
                        'https://static.fibre2fashion.com//articleresources/images/87/8609/fashion%20women-small_Small.jpg',
                  ),
                  Categories_Card(
                    title: 'Clothes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/set-with-fashionable-women-s-clothing-skirt-sweater-sandals-accessories_169016-4108.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Pants',
                    imageUrl:
                        'https://truewerk.com/cdn/shop/files/TW-HERO-T2WerkPant-SD-M-1200x1200-bd93c0f_1024x1024.jpg?v=1687827361',
                  ),
                  Categories_Card(
                    title: 'Shoes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/women-rsquo-s-white-high-heel-shoes-fashion_53876-106046.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Accessories',
                    imageUrl:
                        'https://img.freepik.com/free-photo/boots-among-male-accessories-near-gift-cup-drink_23-2148114410.jpg?size=626&ext=jpg',
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Categories_Card(
                    title: 'New',
                    imageUrl:
                        'https://img.freepik.com/free-photo/beautiful-casual-men-fashion-clothes-set_1203-7836.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Clothes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/white-shirt_1339-6377.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Pants',
                    imageUrl:
                        'https://truewerk.com/cdn/shop/files/TW-HERO-T2WerkPant-SD-M-1200x1200-bd93c0f_1024x1024.jpg?v=1687827361',
                  ),
                  Categories_Card(
                    title: 'Shoes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Accessories',
                    imageUrl:
                        'https://img.freepik.com/free-photo/boots-among-male-accessories-near-gift-cup-drink_23-2148114410.jpg?size=626&ext=jpg',
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Categories_Card(
                    title: 'New',
                    imageUrl:
                        'https://img.freepik.com/free-photo/beautiful-casual-men-fashion-clothes-set_1203-7836.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Clothes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/white-shirt_1339-6377.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Pants',
                    imageUrl:
                        'https://truewerk.com/cdn/shop/files/TW-HERO-T2WerkPant-SD-M-1200x1200-bd93c0f_1024x1024.jpg?v=1687827361',
                  ),
                  Categories_Card(
                    title: 'Shoes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Accessories',
                    imageUrl:
                        'https://img.freepik.com/free-photo/boots-among-male-accessories-near-gift-cup-drink_23-2148114410.jpg?size=626&ext=jpg',
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Categories_Card(
                    title: 'New',
                    imageUrl:
                        'https://img.freepik.com/free-photo/beautiful-casual-men-fashion-clothes-set_1203-7836.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Clothes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/white-shirt_1339-6377.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Pants',
                    imageUrl:
                        'https://truewerk.com/cdn/shop/files/TW-HERO-T2WerkPant-SD-M-1200x1200-bd93c0f_1024x1024.jpg?v=1687827361',
                  ),
                  Categories_Card(
                    title: 'Shoes',
                    imageUrl:
                        'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?size=626&ext=jpg',
                  ),
                  Categories_Card(
                    title: 'Accessories',
                    imageUrl:
                        'https://img.freepik.com/free-photo/boots-among-male-accessories-near-gift-cup-drink_23-2148114410.jpg?size=626&ext=jpg',
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}

class Categories_Card extends StatelessWidget {
  const Categories_Card({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  final title;
  final imageUrl;
  @override
  Widget build(BuildContext context) {
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
                child: GestureDetector(
                  onTap: (){print('hi');},
                  child: Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
                  ),
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
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Adidas',
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    ),
                    Text(
                      '50' + '\$',
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
                  IconButton(onPressed: (){print("love");}, icon: Icon(Icons.favorite_border)),
                ],
              )
            ],
          )),
    );
  }
}
