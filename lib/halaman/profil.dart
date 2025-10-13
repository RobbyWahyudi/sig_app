// import 'package:flutter/material.dart';

// class Profil extends StatelessWidget {
//   const Profil({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('Beranda'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: const Text(
//           "Ini Halaman Profile",
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SIG Wisata Pamekasan")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-7.1614, 113.4823), // Koordinat Pamekasan
          initialZoom: 12,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-7.1614, 113.4823),
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
