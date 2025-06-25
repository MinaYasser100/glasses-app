import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses_app/login/ui/login_view.dart';
import 'package:glasses_app/register/manager/register_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 54, 85, 88),
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color.fromARGB(255, 54, 85, 88),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: const BorderSide(color: Color.fromARGB(255, 54, 85, 88)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              elevation: 9,
            ),
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}

//صفحه للارشاد واختيار الصفح

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedProduct = 'Preservation glasses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop by frame shape'),
        titleTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 7, 146, 130),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Choose the perfect frames for your face or your style .",
            style: TextStyle(
              color: Color.fromARGB(255, 7, 146, 130),
              fontSize: 13,
            ),
          ),
          Container(
            padding: EdgeInsets.all(9),
            child: Image.asset(
              'images/f4ea1436fa485128853f9ad19fa4620a1980e673.jpg',
              height: 400,
              width: 350,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Explore categories",
            style: TextStyle(
              color: Color.fromARGB(255, 7, 146, 130),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            buildButton('Lens', () {
              //انتقال صفحه lens
            }),
            SizedBox(width: 45),
            buildButton('Champer', () {
              //انتقال اللى صفحه champer
            }),
          ]),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonFormField<String>(
              value: selectedProduct,
              decoration: InputDecoration(
                label: Text(
                  "Product",
                  style: TextStyle(
                    color: Color.fromARGB(255, 7, 146, 130),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              icon: Icon(Icons.arrow_drop_up,
                  color: Color.fromARGB(255, 7, 146, 130)),
              items: ['Preservation glasses', 'sunglasses']
                  .map((product) => DropdownMenuItem<String>(
                        value: product,
                        child: Text(product),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedProduct = value!;
                });

                if (value == 'Preservation glasses') {
                  // Navigator.push(...);
                } else if (value == 'sunglasses') {
                  // Navigator.push(...);
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
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(239, 255, 255, 255),
          foregroundColor: Color.fromARGB(255, 7, 146, 130),
          textStyle: TextStyle(fontSize: 15),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}

//صفحه الاماكن اللى بنرشحها للشراء منها

void main() => runApp(SeeStyleApp());

class SeeStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlacesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PlacesPage extends StatelessWidget {
  final List<Map<String, dynamic>> places = [
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
        "images/ebcfb3977010498b3c3e3c86203b2875fc88856d.jpg"
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
        "images/f73327c7c06b7cf10d98a9a70e35dd7ee152906d.jpg"
      ]
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
      ]
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
      ]
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
      ]
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
      ]
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
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "PLACES:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
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
                    margin: EdgeInsets.all(5),
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
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 7, 146, 130)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text("${place['rating']}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 7, 146, 130))),
                                    SizedBox(width: 3),
                                    buildStars(place['rating']),
                                    SizedBox(width: 3),
                                    Flexible(
                                      child: Text(
                                        "(${place['reviews']})",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 7, 146, 130)),
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Expanded(
                                      child: Text(". ${place['type']}",
                                          style: TextStyle(
                                              fontSize: 8.7,
                                              color: Color.fromARGB(
                                                  255, 7, 146, 130))),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(place['adderss'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromARGB(255, 7, 146, 130))),
                                if (place.containsKey('phone'))
                                  Text(place['phone'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 7, 146, 130))),
                                Row(
                                  children: [
                                    Text(
                                      place['status'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: place['status'] == 'Open'
                                            ? Colors.grey
                                            : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        " . ${place['hours'] ?? place['openTime'] ?? ''}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 7, 146, 130)))
                                  ],
                                ),
                                Text(
                                  "in-store shopping . kerbside pickup . Delivery",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color.fromARGB(255, 7, 146, 130)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: place['image'] != null &&
                                    place['image'].toString().isNotEmpty
                                ? Image.asset(
                                    place['image'],
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.image_not_supported),
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
}

Widget buildStars(double rating) {
  int fullStars = rating.floor();
  bool halfStar = (rating - fullStars) >= 0.5;

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) {
      if (index < fullStars) {
        return Icon(Icons.star, color: Colors.amber, size: 16);
      } else if (index == fullStars && halfStar) {
        return Icon(Icons.star_half, color: Colors.amber, size: 16);
      } else {
        return Icon(Icons.star_border, color: Colors.grey, size: 16);
      }
    }),
  );
}

class PlaceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceDetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place['name'] ?? 'Place Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(place['name'] ?? '',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800])),
            Row(
              children: [
                Text("${place['rating']}",
                    style: TextStyle(
                        fontSize: 10, color: Color.fromARGB(255, 7, 146, 130))),
                SizedBox(width: 4),
                buildStars(place['rating']),
                SizedBox(width: 4),
                Text(
                  "(${place['reviews']})",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 7, 146, 130)),
                ),
                SizedBox(width: 4),
                Text(". ${place['type']}",
                    style: TextStyle(
                        fontSize: 10, color: Color.fromARGB(255, 7, 146, 130))),
              ],
            ),
            SizedBox(height: 4),
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
                SizedBox(height: 5),
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
                        child: Icon(Icons.image_not_supported),
                      ),
              ],
            ),
            SizedBox(height: 8),
            Text("Located in:  ${place['Located in']}",
                style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            if (place.containsKey('Offer') &&
                (place['Offer']?.toString().isNotEmpty ?? false))
              Text("Offer:  ${place['Offer']}",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("adderss:  ${place['adderss']}",
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
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
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ✅ دالة إنشاء نجوم التقييم (تحتاجها أنت على الأرجح)
  Widget buildStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (index == fullStars && hasHalfStar) {
          return Icon(Icons.star_half, color: Colors.amber, size: 16);
        } else {
          return Icon(Icons.star_border, color: Colors.amber, size: 16);
        }
      }),
    );
  }
}

//(صفحه النظارات الطبيه(الحمايه

void main() {
  runApp(MyApp());
}

class Glasses {
  String image;
  double Price;

  Glasses({
    required this.image,
    required this.Price,
  });
}

class MyApp extends StatelessWidget {
  final List<Glasses> glasses = [
    Glasses(
        image: "images/d58b990e9299d358394cf9051db6db4434bb6863.jpg",
        Price: 10.00),
    Glasses(
        image: "images/7427b1005981273605ef2da8339fd2f1c2fedcd7.jpg",
        Price: 15.00),
    Glasses(
        image: "images/f713244b335d9178fc271d7c5b1277d050456387.jpg",
        Price: 33.00),
    Glasses(
        image: "images/dfd7f23d72b4202d6a06e80c7bbb41187d536ed2.jpg",
        Price: 11.00),
    Glasses(
        image: "images/618402f1327d6e3b13fa44438fb580695644ad7e.jpg",
        Price: 20.00),
    Glasses(
        image: "images/7493577d6f42a87a2163fd82b48ff16071ea2fe0.jpg",
        Price: 22.00),
    Glasses(
        image: "images/55334e4f168c8158405080ba66f291897c5e92c4.jpg",
        Price: 40.00),
    Glasses(
      image: "images/591d1a49e72c78fba692520fab372b69bdbf5f8b.jpg",
      Price: 14.00,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(glasses: glasses),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Glasses> glasses;

  const HomePage({Key? key, required this.glasses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Brows Preservation glasses',
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            'images/efa4a2012571ece9d62e59ed68ea4e4c6025eea6.jpg',
            height: 170,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "CHECK OUR PRODUCTS",
          style: TextStyle(
            color: Color.fromARGB(255, 7, 146, 130),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(8),
            itemCount: glasses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(children: [
                    Expanded(
                        child: Image.asset(glass.image, fit: BoxFit.cover)),
                    Text(
                      ' \$ ${glass.Price.toStringAsFixed(2)}',
                      style: TextStyle(
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
                          // الانتقال لصفحة الكارت مع إرسال المنتج
                          /* Navigator.push(
                               context,
                                MaterialPageRoute(
                                builder: (context) => CartPage(
                                   cartItems: [
                                   {
                          
                                  "price": Price,
                                  "image": image,
                                    }
                 
                                  ],
                                 ),
                                ),
                             );*/
                        },
                        child: Text('ADD TO CART'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(239, 255, 255, 255),
                          foregroundColor: Color.fromARGB(255, 7, 146, 130),
                          textStyle: TextStyle(
                            fontSize: 10,
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

//صفحه النظارات الشمس

void main() {
  runApp(MyApp());
}

class Glasses {
  String image;
  double Price;

  Glasses({
    required this.image,
    required this.Price,
  });
}

class MyApp extends StatelessWidget {
  final List<Glasses> glasses = [
    Glasses(
        image: "images/96661fd1a8299fd22f122293bdb5ed8b1c8e9715.jpg",
        Price: 10.00),
    Glasses(
        image: "images/e23b9e2ff55d76eec86d70a7bee689f04336e7a9.jpg",
        Price: 15.00),
    Glasses(
        image: "images/fcd3ba7f51228b07c618d90d02fbfa4207648455.jpg",
        Price: 33.00),
    Glasses(
        image: "images/6acc52433ae48c711f3065d1cac8b179eb03a7bb.jpg",
        Price: 11.00),
    Glasses(
        image: "images/50bed2dfc7e0b5973a80f7171b29d15e786b2ee1.jpg",
        Price: 20.00),
    Glasses(
        image: "images/ddeb594e7ce7a21d65dee8b24cee7e1efa678e10.jpg",
        Price: 22.00),
    Glasses(
        image: "images/afb53c70bf587c6009e08b0473180c69c9318567.jpg",
        Price: 40.00),
    Glasses(
      image: "images/df1ab768af27b05a20dd8649dd561b2a023ea851.jpg",
      Price: 14.00,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(glasses: glasses),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Glasses> glasses;

  const HomePage({Key? key, required this.glasses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse sunglasses',
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            'images/1af4ef222a502d4eb32a6da3b10ed701c4117327.jpg',
            height: 190,
            width: 350,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "CHECK OUR PRODUCTS",
          style: TextStyle(
            color: Color.fromARGB(255, 7, 146, 130),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(8),
            itemCount: glasses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Column(children: [
                    Expanded(
                        child: Image.asset(glass.image, fit: BoxFit.cover)),
                    Text(
                      ' \$ ${glass.Price.toStringAsFixed(2)}',
                      style: TextStyle(
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
                          // الانتقال لصفحة الكارت مع إرسال المنتج
                          /* Navigator.push(
                               context,
                                MaterialPageRoute(
                                builder: (context) => CartPage(
                                   cartItems: [
                                   {
                          
                                  "price": Price,
                                  "image": image,
                                    }
                 
                                  ],
                                 ),
                                ),
                             );*/
                        },
                        child: Text('ADD TO CART'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(239, 255, 255, 255),
                          foregroundColor: Color.fromARGB(255, 7, 146, 130),
                          textStyle: TextStyle(
                            fontSize: 10,
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

//صفحه العدسات

void main() {
  runApp(MyApp());
}

class Lenses {
  final String name;
  final String image;

  Lenses({
    required this.name,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  final List<Lenses> lenses = [
    Lenses(
      name: "Magic Blue Cut lenses",
      image: "images/71b829f98f5b9687d2e6f38eba2e595ced0f6c54.jpg",
    ),
    Lenses(
      name: "white plastic lenses",
      image: "images/e2c03b205031fee3b60e97c0b652b1a6a8236f9c.jpg",
    ),
    Lenses(
      name: "Multi-coated lens with reflective coating",
      image: "images/aaeb94d140776d39afb403d3ad929eeacde1df1b.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(lenses: lenses),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Lenses> lenses;

  const HomePage({Key? key, required this.lenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );*/
            },
          ),
          title: Text('Choose Lens')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: lenses.length,
            itemBuilder: (context, index) {
              final lense = lenses[index];

              return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: Expanded(
                      child: Column(children: [
                        Image.asset(
                          lense.image,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 300,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lense.name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 7, 146, 130),
                              ),
                            ),
                            FloatingActionButton.small(
                              backgroundColor: Colors.white,
                              elevation: 0.3,
                              child: Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                // تنفيذ الإجراء عند الضغط على الزر
                              },
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ));
            },
          ),
        ),
      ]),
    );
  }
}

//صفحه الشنابر

void main() {
  runApp(MyApp());
}

class Champer {
  final String name;
  final String image;

  Champer({
    required this.name,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
  final List<Champer> champer = [
    Champer(
      name: "Daniela Rectangle Green Glasses",
      image: "images/6c507fa8b8a5b5ca008aef1f632004f5f97e4885 (1).jpg",
    ),
    Champer(
      name: "Daniela Rectangle Green Glasses",
      image: "images/27f0fc762139b5b76027dce6d54abc7553a42154 (1).jpg",
    ),
    Champer(
      name: "Sileidy Geometric Purple-Pink Glasses",
      image: "images/a30724919a85b4584b8e2d91a9fc12562900f6c5 (1).jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(champer: champer),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Champer> champer;

  const HomePage({Key? key, required this.champer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );*/
            },
          ),
          title: Text('Choose Champer')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: champer.length,
            itemBuilder: (context, index) {
              final champers = champer[index];

              return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: Expanded(
                      child: Column(children: [
                        Image.asset(
                          champers.image, fit: BoxFit.cover,
                          height:
                              200, // ⬅️ حدد الارتفاع حسب رغبتك (مثلاً 160 أو 200 أو أي قيمة)
                          width: 300,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              champers.name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 7, 146, 130),
                              ),
                            ),
                            FloatingActionButton.small(
                              backgroundColor: Colors.white,
                              elevation: 0.3,
                              child: Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                // تنفيذ الإجراء عند الضغط على الزر
                              },
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ));
            },
          ),
        ),
      ]),
    );
  }
}

//الصفحتين الاخرنين
