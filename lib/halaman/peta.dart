import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HalamanPeta extends StatelessWidget {
  const HalamanPeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Peta dan ikon pencarian
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Peta',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(46, 125, 50, 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // aksi pencarian
                      },
                      color: const Color.fromRGBO(46, 125, 50, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Peta
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color.fromRGBO(46, 125, 50, 0.12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 350,
                    child: FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(
                          -7.1617,
                          113.4828,
                        ), // Koordinat Pamekasan
                        initialZoom: 10,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: const LatLng(-7.1617, 113.4828),
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.park,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                            Marker(
                              point: const LatLng(-7.2, 113.48),
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            Marker(
                              point: const LatLng(-7.18, 113.5),
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.museum,
                                color: Colors.orange,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Kategori
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(height: 15),

              // Box kategori
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color.fromRGBO(46, 125, 50, 0.12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 15,
                  children: const [
                    _CategoryItem(
                      icon: Icons.location_on,
                      color: Colors.blue,
                      label: 'Pantai',
                    ),
                    _CategoryItem(
                      icon: Icons.park,
                      color: Colors.green,
                      label: 'Objek wisata',
                    ),
                    _CategoryItem(
                      icon: Icons.museum,
                      color: Colors.orange,
                      label: 'Situs bersejarah',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _CategoryItem({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(46, 125, 50, 0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}
