import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 7, 146, 130),
        ),
      ),
      body:
          cartItems.isEmpty
              ? const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 7, 146, 130),
                  ),
                ),
              )
              : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.asset(
                        item['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item['name'] ?? 'Item',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 7, 146, 130),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '\$${item['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 7, 146, 130),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Logic to remove item from cart
                        },
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
