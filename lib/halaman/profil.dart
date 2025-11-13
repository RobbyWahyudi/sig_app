import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Foto profil / avatar
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 16),

            // Nama pengguna
            const Text(
              'Robby Wahyudi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 40),

            // Menu items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  _buildMenuItem(Icons.history, 'Riwayat', () {
                    // Aksi ketika ditekan
                  }),
                  _buildMenuItem(Icons.bookmark, 'Bookmark', () {}),
                  _buildMenuItem(Icons.settings, 'Pengaturan', () {}),
                  _buildMenuItem(Icons.help_outline, 'Bantuan', () {}),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  _buildMenuItem(
                    Icons.logout,
                    'Logout',
                    () {
                      // Aksi logout
                    },
                    iconColor: Colors.red,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(fontSize: 16, color: textColor)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
