import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import 'place_card.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  final List<Map<String, dynamic>> places = const [
    {
      "name": "H-Optics",
      "rating": 4.8,
      "reviews": 578,
      "type": "Optician in Egypt",
      "address": "El Mokattam",
      "status": "Open",
      "hours": "Close 11 pm",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/e693260a697160ff13e702773a4fc9dbf29dafb2.jpg",
      "location": "Zenkat El Setat",
      "offer": "for all products(for three days)",
    },
    {
      "name": "Al-Batal Optics",
      "rating": 5.0,
      "reviews": 261,
      "type": "Eyeglasses store",
      "address": "6th of October City (2)",
      "phone": "01117889452",
      "status": "Closed",
      "hours": "Opens 1 pm",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/b91924b46dd46e6499475224a67abeb5023986d3.jpg",
      "location": "Al Sakala-Al-Sayyad Village-next to Qasid Karim-Red sea.",
      "offer": "for all products(for three days)",
    },
    {
      "name": "Castle Optics",
      "rating": 4.5,
      "reviews": 184,
      "type": "Eyeglasses store",
      "address": "Cairo",
      "status": "Open",
      "hours": "Close 10 pm",
      "services": ["in-store shopping", "Delivery"],
      "image": "images/default_store.jpg",
      "location": "Downtown Cairo",
      "offer": "Special discount available",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return PlaceCard(
          name: place['name'],
          rating: place['rating'],
          reviews: place['reviews'],
          type: place['type'],
          address: place['address'],
          status: place['status'],
          hours: place['hours'],
          services: List<String>.from(place['services']),
          image: place['image'],
          location: place['location'],
          offer: place['offer'],
          phone: place['phone'],
        );
      },
    );
  }
}
