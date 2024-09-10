import 'package:carwash/screens/layanan_carcoating.dart';
import 'package:carwash/screens/layanan_cardetailing.dart';
import 'package:carwash/screens/layanan_carglass.dart';
import 'package:carwash/screens/layanan_carsalon.dart';
import 'package:carwash/screens/layanan_carwash.dart';
import 'package:carwash/screens/layanan_motorcyclecoating.dart';
import 'package:carwash/screens/layanan_motorcycledetailing.dart';
import 'package:carwash/screens/layanan_motorcyclewash.dart';
import 'package:carwash/screens/profile.dart';
import 'package:carwash/screens/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:carwash/widget/custom_bottom_nav_bar.dart';

class LayananScreen extends StatefulWidget {
  const LayananScreen({super.key});

  @override
  State<LayananScreen> createState() => _LayananScreenState();
}

class _LayananScreenState extends State<LayananScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layanan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildContent(), // Call the _buildContent method
      ),
      bottomNavigationBar: CustomBottomNavBar(
        // Assuming you have a custom bottom nav bar
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildMenuGrid(); // Show the menu grid when index is 0
      case 1:
        return RiwayatScreen(); // Assuming RiwayatScreen is a widget
      case 2:
        return ProfileScreen(); // Assuming ProfileScreen is a widget
      default:
        return Container();
    }
  }

  Widget _buildMenuGrid() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            children: [
              _buildMenuButton('Car Detailing', Icons.build, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cardetailing()),
                );
                // Handle Car Detailing action
              }),
              _buildMenuButton('Car Salon', Icons.time_to_leave, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarSalon()),
                );
              }),
              _buildMenuButton('Carwash', Icons.local_car_wash, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarwashScreen()),
                );
              }),
              _buildMenuButton('Car Glass', Icons.car_repair, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarGlassScreen()),
                );
              }),
              _buildMenuButton('Car Coating', Icons.car_repair, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarCoatingScreen()),
                );
              }),
              _buildMenuButton('Motorcycle Wash', Icons.two_wheeler, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MotorcycleSwashScreen()),
                );
              }),
              _buildMenuButton('Motorcycle Detailing', Icons.two_wheeler, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MotorcycledetailingScreenn()),
                );
              }),
              _buildMenuButton('Motorcycle Coating', Icons.two_wheeler, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MotorcycleCoatingScreen()),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  // Handle the item taps and update the index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildMenuButton(String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(16),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
