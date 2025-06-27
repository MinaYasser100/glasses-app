import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedShipping = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Discover a world of elegance, luxury, and high quality",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Product Item
            _buildProductItem(),
            Divider(),
            _buildProductItem(withDescription: true),
            Divider(height: 40),

            // Shipping options
            _buildShippingSection(),

            const SizedBox(height: 20),
            // Payment icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.credit_card, size: 30),
                Icon(Icons.local_shipping, size: 30),
              ],
            ),
            const SizedBox(height: 20),

            // Return Policy
            Text(
              "Returns and Exchanges: Easy to return and exchange products",
              style: TextStyle(color: Colors.teal[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem({bool withDescription = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Product", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          children: [
            Image.network(
              'https://my.clevelandclinic.org/-/scassets/images/org/health/articles/10737-contacts',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (withDescription)
                    Text(
                      "Stylish sunglasses. Decorative sunglasses for women with a metal and diamond rim. Large frame and elegant style...",
                      style: TextStyle(fontSize: 12, color: Colors.orange[800]),
                    ),
                  if (withDescription) SizedBox(height: 8),
                  Text("320.00 EGP",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  if (withDescription)
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Frame Color: Black - "),
                          TextSpan(
                              text: "Style: Boho, Party - ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "Frame Material: PC - "),
                          TextSpan(text: "Lens Material: Resin"),
                        ],
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.delete_outline, color: Colors.red),
          label: Text("Remove element", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }

  Widget _buildShippingSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text("Total shopping cart",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total"),
              Text("875.00 EGP", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery"),
              Text("66.00 EGP", style: TextStyle(color: Colors.grey[800])),
            ],
          ),
          const SizedBox(height: 20),
          _buildShippingOption(0, "Aramex Express Shipping", "1-3 business days", "66.00 EGP"),
          _buildShippingOption(1, "Aramex", "Free", "0.00 EGP"),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total"),
              Text("941.00 EGP", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShippingOption(int index, String title, String duration, String cost) {
    return RadioListTile(
      value: index,
      groupValue: selectedShipping,
      onChanged: (value) {
        setState(() {
          selectedShipping = value!;
        });
      },
      title: Text(title),
      subtitle: Text(duration),
      secondary: Text(cost),
      contentPadding: EdgeInsets.zero,
    );
  }
}
