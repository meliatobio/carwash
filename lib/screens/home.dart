import 'package:carwash/screens/booking.dart';
import 'package:carwash/screens/layanan.dart';
import 'package:carwash/screens/login.dart';
import 'package:carwash/screens/profile.dart';
import 'package:carwash/screens/riwayat.dart';
import 'package:carwash/screens/tentang.dart';
import 'package:carwash/screens/treatment.dart';
import 'package:carwash/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sastra Garage',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: _getBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Bagian Banner
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 180,
                  child: PageView(
                    children: [
                      Image.asset(
                        'assets/images/banner.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Bagian Tombol
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildMenuButton('Layanan', Icons.build, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayananScreen()),
                      );
                    }),
                    _buildMenuButton('Booking', Icons.calendar_today, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingScreen()),
                      );
                    }),
                    _buildMenuButton('Tentang', Icons.info, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TentangScreen()),
                      );
                    }),
                    _buildMenuButton('Treatment', Icons.car_repair, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TreatmentScreen()),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      case 1:
        return RiwayatScreen();
      case 2:
        return ProfileScreen();
      default:
        return Container();
    }
  }

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
