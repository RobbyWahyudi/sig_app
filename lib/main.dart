import 'package:flutter/material.dart';
import 'halaman/beranda.dart';
import 'halaman/peta.dart';
import 'halaman/profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIG Wisata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromRGBO(46, 125, 50, 1),
        fontFamily: 'Roboto',

        //Tambahkan tema NavigationBar di sini
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.blue.shade50,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Color.fromRGBO(46, 125, 50, 1),
                fontWeight: FontWeight.w600,
              );
            }
            return const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Color.fromRGBO(46, 125, 50, 1));
            }
            return const IconThemeData(color: Colors.grey);
          }),
        ),
      ),
      home: const BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNav> {
  int _selectedIndex = 0;
  // final PageController _pageController = PageController();

  // daftar halaman
  final List<Widget> _pages = const [
    HalamanBeranda(),
    HalamanPeta(),
    HalamanProfil(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Peta'),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}


  // void _onItemTapped(int index) {
  //   setState(() => _selectedIndex = index);
  //   _pageController.jumpToPage(index); // pindah halaman
  // }
