import 'package:flutter/material.dart';
class main_header extends StatelessWidget {
  const main_header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      Container(
        width: double.infinity,
        height: 500,
        color: Colors.black.withOpacity(1),
        child: Opacity(
          opacity: 0.8,
          child: Image.network(
            'https://images8.alphacoders.com/102/1021029.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        left: -10,
        child: Container(
          //color: Colors.blue,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fashion',
                  style: TextStyle(
                    color: Colors.white.withOpacity(1),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  )),
              Text('Sale',
                  style: TextStyle(
                    color: Colors.white.withOpacity(1),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  )),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFe08243),
                  textStyle: const TextStyle(fontSize: 30, color: Colors.white),
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Border radius
                  ),
                ),
                child: const Text('Check'),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
