import 'package:flutter/material.dart';
import 'package:carwash/models/tentang.dart';
import 'package:carwash/widget/custom_bottom_nav_bar.dart';

class TentangScreen extends StatefulWidget {
  const TentangScreen({Key? key}) : super(key: key);

  @override
  State<TentangScreen> createState() => _TentangScreenState();
}

class _TentangScreenState extends State<TentangScreen> {
  int _selectedIndex = 0;
  late Future<Tentang> futureTentang;

  @override
  void initState() {
    super.initState();
    futureTentang = Tentang.fetchTentang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<Tentang>(
        future: futureTentang,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final tentangData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang Kami',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Gambar
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://carwash.diatakasir.com/assets/images/${tentangData.foto}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Deskripsi
                  Text(
                    tentangData.deskripsi,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24.0),
                  // Jam Kerja & Kontak
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jam Kerja',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            tentangData.jamKerja,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kontak Kami',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(Icons.phone, size: 16),
                              const SizedBox(width: 4.0),
                              Text(
                                tentangData.noHp,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  // Alamat
                  const Text(
                    'Alamat',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    tentangData.alamat,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
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
