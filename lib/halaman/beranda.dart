import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Beranda'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const Text(
              'Sistem Informasi Geografis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () => {print("click")},
              child: const Text(
                "Tombol",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(top: 30, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[400],
                  ),
                  child: const Text(
                    "Biru",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const Text("Kartu Biru", style: TextStyle(fontSize: 20)),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(top: 20, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green[400],
                  ),
                  child: const Text(
                    "Hijau",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const Text("Kartu Hijau", style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
