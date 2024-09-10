import 'package:carwash/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MotorcycleSwashScreen extends StatefulWidget {
  const MotorcycleSwashScreen({super.key});

  @override
  State<MotorcycleSwashScreen> createState() => _MotorcycleSwashScreenState();
}

class _MotorcycleSwashScreenState extends State<MotorcycleSwashScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Motorcycle Wash',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Description Text
              const Text(
                'Temukan berbagai paket cuci mobil yang sesuai dengan kebutuhan Anda.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Section Title
              const Text(
                'Harga Paket',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Two cards for Wash & Wax and Regular Wash
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Wash & Wax Card
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Wash & Wax',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('M   Rp. 30.000'),
                            Text('L   Rp. 40.000'),
                            Text('XL  Rp. 50.000'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Regular Wash Card
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Wash Reguler',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('M   Rp. 15.000'),
                            Text('L   Rp. 20.000'),
                            Text('XL  Rp. 25.000'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Wash & Wax Card

                  const SizedBox(width: 16),
                  // Regular Wash Card
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Premium Wash',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('M   Rp. 85.000'),
                            Text('L   Rp. 100.000'),
                            Text('XL  Rp. 125.000'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Additional Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio, vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        // Assuming you have a custom bottom nav bar
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
