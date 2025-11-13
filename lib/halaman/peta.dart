import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HalamanPeta extends StatelessWidget {
  const HalamanPeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // aksi pencarian
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Peta
              ClipRRect(
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

              const SizedBox(height: 25),

              // Kategori
              const Text(
                'Kategori',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Box kategori
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
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
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 15, color: Colors.black)),
      ],
    );
  }
}
