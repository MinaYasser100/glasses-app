import '../models/glasses.dart';

class GlassesService {
  // Static data for now - in a real app, this would come from an API
  static final List<Glasses> _preservationGlasses = [
    const Glasses(
      id: '1',
      name: 'Classic Reading Glasses',
      image: "images/d58b990e9299d358394cf9051db6db4434bb6863.jpg",
      price: 10.00,
      category: 'Preservation glasses',
      description: 'Comfortable reading glasses for daily use',
    ),
    const Glasses(
      id: '2',
      name: 'Modern Frame Glasses',
      image: "images/7427b1005981273605ef2da8339fd2f1c2fedcd7.jpg",
      price: 15.00,
      category: 'Preservation glasses',
      description: 'Stylish modern frames',
    ),
    const Glasses(
      id: '3',
      name: 'Premium Glasses',
      image: "images/f713244b335d9178fc271d7c5b1277d050456387.jpg",
      price: 33.00,
      category: 'Preservation glasses',
      description: 'High-quality premium glasses',
    ),
    const Glasses(
      id: '4',
      name: 'Essential Glasses',
      image: "images/dfd7f23d72b4202d6a06e80c7bbb41187d536ed2.jpg",
      price: 11.00,
      category: 'Preservation glasses',
      description: 'Essential everyday glasses',
    ),
    const Glasses(
      id: '5',
      name: 'Designer Frame',
      image: "images/618402f1327d6e3b13fa44438fb580695644ad7e.jpg",
      price: 20.00,
      category: 'Preservation glasses',
      description: 'Designer frame glasses',
    ),
    const Glasses(
      id: '6',
      name: 'Professional Glasses',
      image: "images/7493577d6f42a87a2163fd82b48ff16071ea2fe0.jpg",
      price: 22.00,
      category: 'Preservation glasses',
      description: 'Professional looking glasses',
    ),
    const Glasses(
      id: '7',
      name: 'Luxury Glasses',
      image: "images/55334e4f168c8158405080ba66f291897c5e92c4.jpg",
      price: 40.00,
      category: 'Preservation glasses',
      description: 'Luxury premium glasses',
    ),
    const Glasses(
      id: '8',
      name: 'Comfort Glasses',
      image: "images/591d1a49e72c78fba692520fab372b69bdbf5f8b.jpg",
      price: 14.00,
      category: 'Preservation glasses',
      description: 'Comfortable daily wear glasses',
    ),
  ];

  static final List<Glasses> _sunglasses = [
    const Glasses(
      id: '9',
      name: 'Classic Sunglasses',
      image: "images/96661fd1a8299fd22f122293bdb5ed8b1c8e9715.jpg",
      price: 10.00,
      category: 'Sunglasses',
      description: 'Classic style sunglasses',
    ),
    const Glasses(
      id: '10',
      name: 'Modern Sunglasses',
      image: "images/e23b9e2ff55d76eec86d70a7bee689f04336e7a9.jpg",
      price: 15.00,
      category: 'Sunglasses',
      description: 'Modern trendy sunglasses',
    ),
    const Glasses(
      id: '11',
      name: 'Premium Sunglasses',
      image: "images/fcd3ba7f51228b07c618d90d02fbfa4207648455.jpg",
      price: 33.00,
      category: 'Sunglasses',
      description: 'Premium UV protection sunglasses',
    ),
    const Glasses(
      id: '12',
      name: 'Sport Sunglasses',
      image: "images/6acc52433ae48c711f3065d1cac8b179eb03a7bb.jpg",
      price: 11.00,
      category: 'Sunglasses',
      description: 'Sports and outdoor sunglasses',
    ),
    const Glasses(
      id: '13',
      name: 'Designer Sunglasses',
      image: "images/50bed2dfc7e0b5973a80f7171b29d15e786b2ee1.jpg",
      price: 20.00,
      category: 'Sunglasses',
      description: 'Designer brand sunglasses',
    ),
    const Glasses(
      id: '14',
      name: 'Fashion Sunglasses',
      image: "images/ddeb594e7ce7a21d65dee8b24cee7e1efa678e10.jpg",
      price: 22.00,
      category: 'Sunglasses',
      description: 'Fashion forward sunglasses',
    ),
    const Glasses(
      id: '15',
      name: 'Luxury Sunglasses',
      image: "images/afb53c70bf587c6009e08b0473180c69c9318567.jpg",
      price: 40.00,
      category: 'Sunglasses',
      description: 'Luxury premium sunglasses',
    ),
    const Glasses(
      id: '16',
      name: 'Casual Sunglasses',
      image: "images/df1ab768af27b05a20dd8649dd561b2a023ea851.jpg",
      price: 14.00,
      category: 'Sunglasses',
      description: 'Casual everyday sunglasses',
    ),
  ];

  Future<List<Glasses>> getGlassesByCategory(String category) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    switch (category.toLowerCase()) {
      case 'preservation glasses':
        return _preservationGlasses;
      case 'sunglasses':
        return _sunglasses;
      default:
        return [..._preservationGlasses, ..._sunglasses];
    }
  }

  Future<List<Glasses>> getAllGlasses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [..._preservationGlasses, ..._sunglasses];
  }

  Future<Glasses?> getGlassesById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final allGlasses = [..._preservationGlasses, ..._sunglasses];
    try {
      return allGlasses.firstWhere((glasses) => glasses.id == id);
    } catch (e) {
      return null;
    }
  }
}
