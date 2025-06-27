import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:glasses_app/features/champer/view/champer_view.dart';
import 'package:glasses_app/features/lenses/view/lenses_view.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Widget buildSection(String title, String hint, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              fontSize: 16,
            )),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.centerLeft,
                child: Text(hint),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: onTap,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  String? lensName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
              )),
          title: Text(
            'Place Order',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSection('Choose Lens', lensName ?? 'select lense type', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LensesView(
                      onTap: (lens) {
                        log("lense selected");

                        setState(() {
                          lensName = lens['name'];
                        });

                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              }),
              buildSection('Choose Frame', 'select frame style', () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChamperView() ;
                }));
              }),
              buildSection('Upload Image', 'upload your photo', _pickImage),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.file(_selectedImage!, height: 100),
                ),
              buildSection('Choose Offers', 'select available offers', () {}),
              Text("(period : from 5-7 days)", style: TextStyle(fontSize: 12)),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.teal[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.teal[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  onPressed: () {},
                  child: Text('Submit',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
