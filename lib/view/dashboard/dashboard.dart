import 'package:carwash/controller/AuthController.dart';
import 'package:carwash/controller/HomeController.dart';
import 'package:carwash/view/booking/booking.dart';
import 'package:carwash/view/home/home.dart';
import 'package:carwash/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final home = Get.put(Homecontroller());
  var auth = Get.put(AuthController());

  final List<Widget> _pages = [
    HomeScreen(),
    const BookingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                auth.logout();
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        body: _pages[home.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: home.currentIndex.value,
          onTap: home.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
