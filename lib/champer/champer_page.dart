import 'package:flutter/material.dart';

class Champer {
  final String name;
  final String image;
  final double price;

  Champer({required this.name, required this.image, required this.price});
}

class ChamperPage extends StatelessWidget {
  ChamperPage({super.key});

  final List<Champer> champer = [
    Champer(
      name: "Daniela Rectangle Green Glasses",
      image: "images/6c507fa8b8a5b5ca008aef1f632004f5f97e4885 (1).jpg",
      price: 18.00,
    ),
    Champer(
      name: "Daniela Rectangle Green Glasses",
      image: "images/27f0fc762139b5b76027dce6d54abc7553a42154 (1).jpg",
      price: 18.00,
    ),
    Champer(
      name: "Sileidy Geometric Purple-Pink Glasses",
      image: "images/a30724919a85b4584b8e2d91a9fc12562900f6c5 (1).jpg",
      price: 22.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Choose Champer'),
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 7, 146, 130),
        ),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: champer.length,
              itemBuilder: (context, index) {
                final champerItem = champer[index];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: Column(
                      children: [
                        Image.asset(
                          champerItem.image,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 300,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              champerItem.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 7, 146, 130),
                              ),
                            ),
                            Text(
                              '\$${champerItem.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 7, 146, 130),
                              ),
                            ),
                            FloatingActionButton.small(
                              backgroundColor: Colors.white,
                              elevation: 0.3,
                              child: const Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/cart',
                                  arguments: [
                                    {
                                      "price": champerItem.price,
                                      "image": champerItem.image,
                                      "name": champerItem.name,
                                    },
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
