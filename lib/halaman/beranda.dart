import 'package:flutter/material.dart';
import '../widgets/kartu.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> destinations = [
      {
        "name": "Pantai Jumiang",
        "location": "Pamekasan",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZVTRQ1fb3RH3CUiVBBGt4Yr9WXuzoPSwYVQ&s",
        "rating": 4.5,
      },
      {
        "name": "Bukit Brukoh",
        "location": "Pamekasan",
        "image":
            "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/photo/2023/02/23/20230223_084330-2291286558.jpg",
        "rating": 4.0,
      },
      {
        "name": "Air Terjun",
        "location": "Pamekasan",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfpeBRbp6d1h0abES1T0QHtbrVKTiDMX_Ow&s",
        "rating": 4.2,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Color.fromRGBO(46, 125, 50, 1)),
            SizedBox(width: 8),
            Text('Wisata', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.menu_rounded), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  // Gambar latar
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?cs=srgb&dl=pexels-asadphoto-457882.jpg&fm=jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Overlay putih transparan hanya di atas gambar
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withValues(
                        alpha: 0.4,
                      ), // ubah 0.4 jadi 0.3 atau 0.5 sesuai selera
                    ),
                  ),

                  // Teks dan tombol di atas overlay
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Temukan Destinasi\nWisata Terbaik di Pamekasan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(46, 125, 50, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Selengkapnya',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Menu icon row
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _menuItem(Icons.map, 'Peta Wisata'),
                  _menuItem(Icons.category, 'Kategori'),
                  _menuItem(Icons.reviews, 'Ulasan'),
                  _menuItem(Icons.more, 'Lainnya'),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Rekomendasi Terbaik Untukmu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 12),

            Column(
              children: destinations
                  .map(
                    (dest) => Kartu(
                      name: dest['name'],
                      location: dest['location'],
                      imageUrl: dest['image'],
                      rating: dest['rating'],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String label) {
    return Container(
      width: 85,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color.fromRGBO(46, 125, 50, 1), size: 28),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
