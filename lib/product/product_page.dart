import 'package:flutter/material.dart';
import 'package:glasses_app/glasses/glasses_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedProduct = 'Preservation glasses';

  final List<Glasses> preservationGlasses = [
    Glasses(
      image: "images/d58b990e9299d358394cf9051db6db4434bb6863.jpg",
      price: 10.00,
    ),
    Glasses(
      image: "images/7427b1005981273605ef2da8339fd2f1c2fedcd7.jpg",
      price: 15.00,
    ),
    Glasses(
      image: "images/f713244b335d9178fc271d7c5b1277d050456387.jpg",
      price: 33.00,
    ),
    Glasses(
      image: "images/dfd7f23d72b4202d6a06e80c7bbb41187d536ed2.jpg",
      price: 11.00,
    ),
    Glasses(
      image: "images/618402f1327d6e3b13fa44438fb580695644ad7e.jpg",
      price: 20.00,
    ),
    Glasses(
      image: "images/7493577d6f42a87a2163fd82b48ff16071ea2fe0.jpg",
      price: 22.00,
    ),
    Glasses(
      image: "images/55334e4f168c8158405080ba66f291897c5e92c4.jpg",
      price: 40.00,
    ),
    Glasses(
      image: "images/591d1a49e72c78fba692520fab372b69bdbf5f8b.jpg",
      price: 14.00,
    ),
  ];

  final List<Glasses> sunglasses = [
    Glasses(
      image: "images/96661fd1a8299fd22f122293bdb5ed8b1c8e9715.jpg",
      price: 10.00,
    ),
    Glasses(
      image: "images/e23b9e2ff55d76eec86d70a7bee689f04336e7a9.jpg",
      price: 15.00,
    ),
    Glasses(
      image: "images/fcd3ba7f51228b07c618d90d02fbfa4207648455.jpg",
      price: 33.00,
    ),
    Glasses(
      image: "images/6acc52433ae48c711f3065d1cac8b179eb03a7bb.jpg",
      price: 11.00,
    ),
    Glasses(
      image: "images/50bed2dfc7e0b5973a80f7171b29d15e786b2ee1.jpg",
      price: 20.00,
    ),
    Glasses(
      image: "images/ddeb594e7ce7a21d65dee8b24cee7e1efa678e10.jpg",
      price: 22.00,
    ),
    Glasses(
      image: "images/afb53c70bf587c6009e08b0473180c69c9318567.jpg",
      price: 40.00,
    ),
    Glasses(
      image: "images/df1ab768af27b05a20dd8649dd561b2a023ea851.jpg",
      price: 14.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop by frame shape'),
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 7, 146, 130),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Choose the perfect frames for your face or your style.",
            style: TextStyle(
              color: Color.fromARGB(255, 7, 146, 130),
              fontSize: 13,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(9),
            child: Image.asset(
              'images/f4ea1436fa485128853f9ad19fa4620a1980e673.jpg',
              height: 400,
              width: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Explore categories",
            style: TextStyle(
              color: Color.fromARGB(255, 7, 146, 130),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('Lens', () {
                Navigator.pushNamed(context, '/lenses');
              }),
              const SizedBox(width: 45),
              buildButton('Champer', () {
                Navigator.pushNamed(context, '/champer');
              }),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonFormField<String>(
              value: selectedProduct,
              decoration: InputDecoration(
                label: const Text(
                  "Product",
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 146, 130),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color.fromARGB(255, 7, 146, 130),
              ),
              items:
                  ['Preservation glasses', 'Sunglasses']
                      .map(
                        (product) => DropdownMenuItem<String>(
                          value: product,
                          child: Text(product),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedProduct = value!;
                });
                if (value == 'Preservation glasses') {
                  Navigator.pushNamed(
                    context,
                    '/glasses',
                    arguments: {
                      'title': 'Browse Preservation Glasses',
                      'glasses': preservationGlasses,
                    },
                  );
                } else if (value == 'Sunglasses') {
                  Navigator.pushNamed(
                    context,
                    '/sunglasses',
                    arguments: {
                      'title': 'Browse Sunglasses',
                      'glasses': sunglasses,
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: 85,
      height: 25,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(239, 255, 255, 255),
          foregroundColor: const Color.fromARGB(255, 7, 146, 130),
          textStyle: const TextStyle(fontSize: 15),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
        child: Text(label),
      ),
    );
  }
}
