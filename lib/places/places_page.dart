import 'package:flutter/material.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key});

  final List<Map<String, dynamic>> places = const [
    {
      "name": "H-Optics",
      "rating": 4.8,
      "reviews": 578,
      "type": "Optician in Egypt",
      "adderss": "El Mokattam",
      "status": "Open",
      "hours": "Close 11 pm",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/e693260a697160ff13e702773a4fc9dbf29dafb2.jpg",
      "Located in": "Zenkat El Setat",
      "Offer": "for all products(for three days)",
      "images": [
        "images/b5de7737ad1b28ab2dcd04669949543e7a4f79d8.jpg",
        "images/11bdaa140af687fe9f1dc4fbab9f14fe1aa24497.jpg",
        "images/2b1b9ae37dd00703843efe2e32a27a413541effc.jpg",
        "images/ebcfb3977010498b3c3e3c86203b2875fc88856d.jpg",
      ],
    },
    {
      "name": "Al-Batal Optics",
      "rating": 5.0,
      "reviews": 261,
      "type": "Eyeglasses store",
      "adderss": "6th of October City (2)",
      "phone": "01117889452",
      "status": "Closed",
      "hours": "Opens 1 pm",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/b91924b46dd46e6499475224a67abeb5023986d3.jpg",
      "Located in": "Al Sakala-Al-Sayyad Village-next to Qasid Karim-Red sea.",
      "Offer": "for all products(for three days)",
      "images": [
        "images/2de377fc75965cacec91356d99b875e978753962.jpg",
        "images/6adc016412a2e618090cddb70ac662ca508e8801.jpg",
        "images/1e5f47f369e5ed53d8d9179a6cf3dbddcfe48f22.jpg",
        "images/db5f9609175006679e5f66eb6a3049bf1d50ec28.jpg",
        "images/f73327c7c06b7cf10d98a9a70e35dd7ee152906d.jpg",
      ],
    },
    {
      "name": "Castle Optics",
      "rating": 4.5,
      "reviews": 184,
      "type": "optical Store ratio",
      "adderss": "Abdeen",
      "phone": "01004409230",
      "status": "Open",
      "hours": "Closes 11 pm",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/d98f7d3608f360ba49cc8af3e268b5571451bfdf.jpg",
      "Located in":
          "1 Mohamed,Bab El Louk,Doctors'Tower,Ground Floor,Cairo,Egypt",
      "Offer": "for all products(for three days)",
      "images": [
        "images/dec89c320143ccd9e83f58801a2d85318a44322d.jpg",
        "images/22c496287dcba4cb13866b6fc930514740045402.jpg",
        "images/ec57aac513968e76c8d1e09325bba1843bec8e71.jpg",
        "images/9731357b8ec6f7f48cba1f03061b7ff6c89fc25a.jpg",
        "images/db010ef3aab4b774162d7b37bdb4eb88b0f1ab8c.jpg",
      ],
    },
    {
      "name": "Treed Eyewear",
      "rating": 4.3,
      "reviews": 96,
      "type": "Eyeglasses store",
      "adderss": "Nasr City",
      "status": "Closed",
      "openTime": "Opens 2 pm",
      "phone": "01020778451",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/b2d423c73ea0c6691ed8b82f5b7107901448ab2c.jpg",
      "Located in":
          "26 Tag Eldin Elsobki Street,Ard Elgolf,Heliopolis,Cairo,Egypt",
      "images": [
        "images/fb604017f37c0882901ce5300c213e382df1cd64.jpg",
        "images/8ad7e8cbe6bf181dc42013876f1f7da9593f3bef.jpg",
        "images/011bab98a61e38a8276182149206828de973fb08.jpg",
        "images/47d85cea8e2182baff96db9b02fc49afca989843.jpg",
        "images/c3d484ef261e281cbb08f6a3c8c4554f938a1781.jpg",
      ],
    },
    {
      "name": "Hashem Optics",
      "rating": 4.5,
      "reviews": 184,
      "type": "Marketing Center",
      "adderss": "Banha",
      "status": "Open",
      "openTime": "Closes 11 pm",
      "phone": "01050890920",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/eb84056b1fcd356210d7d61f2c5653f5932092a4.jpg",
      "Located in": "Nagib Al Nouri,Qism Banha,Banhan,Al Qalyubia",
      "images": [
        "images/38a2d5eeb6c74043afd53ecf60d41b0c9bc6aaf5.jpg",
        "images/89228594b35883cc335c2a6544a8547cd472c010.jpg",
        "images/425e53e74b4550cdf91104d0be585823f694499f.jpg",
        "images/4099cc250dd251a863fc54439bb83db7f5440efa.jpg",
        "images/43084dd1e57158154365f2794d3a86f8fae9a05a.jpg",
      ],
    },
    {
      "name": "Goiden Vision Optics: Main Branch",
      "rating": 4.6,
      "reviews": 47,
      "type": "optical Store ratio",
      "adderss": "New Cairo 1",
      "status": "Open",
      "openTime": "Closes 11 pm",
      "phone": "01523459807",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/bab3dd1085c013073ea6e95998d4b11dc589ca58.jpg",
      "Located in": "Sama Mall,Second District,Fifth Settlement,New Cairo",
      "images": [
        "images/b3ad6397cae14a3fb92be0f38fe7d9b7d021a76b.jpg",
        "images/a947ec2ab82bd39ea85d12b126f49a37b5c3cede.jpg",
        "images/2e1781d8224639973b8412f7057f2be694f063d1.jpg",
        "images/08839a098eeccf66999129296d92b5aa7a5f737b.jpg",
        "images/537741d0deb36ad67430f94071e4ba2a495eb878.jpg",
      ],
    },
    {
      "name": "Muslim Optics ",
      "rating": 4.9,
      "reviews": 39,
      "type": "Eyeglasses Store",
      "adderss": "Abdeen",
      "status": "Open",
      "openTime": "closes 11 pm",
      "phone": "01156436890",
      "services": ["in-store shopping", "kerbside pickup", "Delivery"],
      "image": "images/1d2bdf35ae6b9b7ddcc803b78ebd152742cdbe01.jpg",
      "Located in": "40 Ibn El Hakam Square,Helmeyet El Zaitoun ,Cairo,Egupt",
      "images": [
        "images/5951a099e67aff8a321b2c71ae6c70cc1938774d.jpg",
        "images/235ffca3da98960b92a1a456659d0ecbcae50972.jpg",
        "images/08b0413a0fa762be6f9faf2e4d11b300a836d178.jpg",
        "images/d45d00a2b6e4e7b7367712227c3585eb041efb5c.jpg",
        "images/5b0c6f100e8449ee3b76b6eab6eda003a9e327f9 (1).jpg",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'SeeStyle',
            style: TextStyle(
              fontSize: 15,
              color: Colors.teal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "PLACES:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlaceDetailsPage(place: place),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place["name"],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 7, 146, 130),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "${place['rating']}",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 7, 146, 130),
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    buildStars(place['rating']),
                                    const SizedBox(width: 3),
                                    Flexible(
                                      child: Text(
                                        "(${place['reviews']})",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                            255,
                                            7,
                                            146,
                                            130,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        ". ${place['type']}",
                                        style: const TextStyle(
                                          fontSize: 8.7,
                                          color: Color.fromARGB(
                                            255,
                                            7,
                                            146,
                                            130,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  place['adderss'],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 7, 146, 130),
                                  ),
                                ),
                                if (place.containsKey('phone'))
                                  Text(
                                    place['phone'],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 7, 146, 130),
                                    ),
                                  ),
                                Row(
                                  children: [
                                    Text(
                                      place['status'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            place['status'] == 'Open'
                                                ? Colors.grey
                                                : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " . ${place['hours'] ?? place['openTime'] ?? ''}",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 7, 146, 130),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "in-store shopping . kerbside pickup . Delivery",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 7, 146, 130),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(color: Colors.grey[300]),
                            child:
                                place['image'] != null &&
                                        place['image'].toString().isNotEmpty
                                    ? Image.asset(
                                      place['image'],
                                      fit: BoxFit.cover,
                                    )
                                    : const Icon(Icons.image_not_supported),
                          ),
                        ],
                      ),
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

  Widget buildStars(double rating) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (index == fullStars && halfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 16);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 16);
        }
      }),
    );
  }
}

class PlaceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceDetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place['name'] ?? 'Place Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              place['name'] ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Row(
              children: [
                Text(
                  "${place['rating']}",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 7, 146, 130),
                  ),
                ),
                const SizedBox(width: 4),
                buildStars(place['rating']),
                const SizedBox(width: 4),
                Text(
                  "(${place['reviews']})",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 7, 146, 130),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  ". ${place['type']}",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 7, 146, 130),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (place['image'] != null &&
                    place['image'].toString().isNotEmpty)
                  Image.asset(
                    place['image'],
                    fit: BoxFit.cover,
                    width: 250,
                    height: 200,
                  ),
                const SizedBox(height: 5),
                place['images'] != null && place['images'] is List
                    ? SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: place['images'].length,
                        itemBuilder: (context, index) {
                          final imagePath = place['images'][index];
                          return Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.asset(
                              imagePath,
                              width: 81,
                              height: 82,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                    : Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Located in:  ${place['Located in']}",
              style: const TextStyle(
                fontSize: 9,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            if (place.containsKey('Offer') &&
                (place['Offer']?.toString().isNotEmpty ?? false))
              Text(
                "Offer:  ${place['Offer']}",
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 4),
            Text(
              "adderss:  ${place['adderss']}",
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "Hours:  ${place['status']}",
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        place['status'] == 'Open' ? Colors.black : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " . ${place['hours'] ?? place['openTime'] ?? ''}",
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 16);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 16);
        }
      }),
    );
  }
}
