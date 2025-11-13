import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 16,
        title: const Row(
          children: [
            Icon(Icons.person_outline, color: Color.fromRGBO(46, 125, 50, 1)),
            SizedBox(width: 8),
            Text(
              'Profil',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Foto profil / avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(46, 125, 50, 0.15),
                    Color.fromRGBO(46, 125, 50, 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const CircleAvatar(
                radius: 45,
                backgroundColor: Color.fromRGBO(46, 125, 50, 0.15),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),

            // Nama pengguna
            const Text(
              'Robby Wahyudi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '@robbywahyudi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromRGBO(46, 125, 50, 0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor == Colors.red
                      ? Colors.red.withOpacity(0.08)
                      : const Color.fromRGBO(46, 125, 50, 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
