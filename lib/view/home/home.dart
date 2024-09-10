import 'package:carwash/controller/AuthController.dart';
import 'package:carwash/router/routers.dart';
import 'package:carwash/view/booking/booking.dart';
import 'package:carwash/view/component/containerhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ContainerHome(
                  title: 'Layanan',
                  icon: Icons.build,
                  link: Routers.register,
                ),
                ContainerHome(
                  title: 'Booking',
                  icon: Icons.calendar_today,
                  link: Routers.register,
                ),
                ContainerHome(
                  title: 'Tentang',
                  icon: Icons.info,
                  link: Routers.register,
                ),
                ContainerHome(
                  title: 'Treatment',
                  icon: Icons.car_repair,
                  link: Routers.register,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
