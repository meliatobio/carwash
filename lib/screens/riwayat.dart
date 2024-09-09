import 'package:carwash/screens/home.dart';

import 'package:carwash/screens/profile.dart';
import 'package:carwash/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  int _selectedIndex = 1; // Menetapkan default tab ke RiwayatScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _getBody(), // Menentukan konten untuk RiwayatScreen
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Method untuk menentukan konten berdasarkan indeks tab
  Widget _getBody() {
    // Ini adalah tempat di mana kamu bisa menambahkan konten untuk RiwayatScreen
    return Center(
      child: Text('Ini adalah halaman Riwayat'),
    );
  }

  // Mengatur navigasi saat tab ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          break;
        case 1:
          // Sudah berada di RiwayatScreen, jadi tidak perlu navigasi
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProfileScreen()), // Pastikan ProfileScreen diimpor
          );
          break;
      }
    });
  }
}
