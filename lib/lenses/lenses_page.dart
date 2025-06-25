import 'package:flutter/material.dart';

class Lenses {
  final String name;
  final String image;
  final double price;

  Lenses({required this.name, required this.image, required this.price});
}

class LensesPage extends StatelessWidget {
  LensesPage({super.key});

  final List<Lenses> lenses = [
    Lenses(
      name: "Magic Blue Cut lenses",
      image: "images/71b829f98f5b9687d2e6f38eba2e595ced0f6c54.jpg",
      price: 25.00,
    ),
    Lenses(
      name: "White plastic lenses",
      image: "images/e2c03b205031fee3b60e97c0b652b1a6a8236f9c.jpg",
      price: 15.00,
    ),
    Lenses(
      name: "Multi-coated lens with reflective coating",
      image: "images/aaeb94d140776d39afb403d3ad929eeacde1df1b.jpg",
      price: 30.00,
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
        title: const Text('Choose Lens'),
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
              itemCount: lenses.length,
              itemBuilder: (context, index) {
                final lens = lenses[index];
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
                          lens.image,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 300,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lens.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 7, 146, 130),
                              ),
                            ),
                            Text(
                              '\$${lens.price.toStringAsFixed(2)}',
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
                                      "price": lens.price,
                                      "image": lens.image,
                                      "name": lens.name,
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
