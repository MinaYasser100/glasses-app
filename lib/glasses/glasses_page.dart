import 'package:flutter/material.dart';

class Glasses {
  final String image;
  final double price;

  Glasses({required this.image, required this.price});
}

class GlassesPage extends StatelessWidget {
  final String title;
  final List<Glasses> glasses;

  const GlassesPage({super.key, required this.title, required this.glasses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 7, 146, 130),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              title.contains('Preservation')
                  ? 'images/efa4a2012571ece9d62e59ed68ea4e4c6025eea6.jpg'
                  : 'images/1af4ef222a502d4eb32a6da3b10ed701c4117327.jpg',
              height: 170,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            "CHECK OUR PRODUCTS",
            style: TextStyle(
              color: Color.fromARGB(255, 7, 146, 130),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: glasses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.90,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 200.9,
              ),
              itemBuilder: (context, index) {
                final glass = glasses[index];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(glass.image, fit: BoxFit.cover),
                        ),
                        Text(
                          '\$${glass.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 7, 146, 130),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 85,
                          height: 25,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/cart',
                                arguments: [
                                  {"price": glass.price, "image": glass.image},
                                ],
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                239,
                                255,
                                255,
                                255,
                              ),
                              foregroundColor: const Color.fromARGB(
                                255,
                                7,
                                146,
                                130,
                              ),
                              textStyle: const TextStyle(fontSize: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text('ADD TO CART'),
                          ),
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
