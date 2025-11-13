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
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 16,
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Color.fromRGBO(46, 125, 50, 1)),
            SizedBox(width: 5),
            Text(
              'Wisata',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {},
              color: const Color.fromRGBO(46, 125, 50, 1),
            ),
          ),
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

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.05),
                          const Color.fromRGBO(
                            46,
                            125,
                            50,
                            1,
                          ).withOpacity(0.25),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
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
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.25,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(
                              46,
                              125,
                              50,
                              1,
                            ),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Selengkapnya'),
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
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 0.1,
              ),
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
      width: 95,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromRGBO(46, 125, 50, 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(46, 125, 50, 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color.fromRGBO(46, 125, 50, 1),
              size: 26,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
