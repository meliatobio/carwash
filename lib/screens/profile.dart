import 'dart:io'; // Untuk bekerja dengan File
import 'package:carwash/screens/editpassword.dart';
import 'package:carwash/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Untuk jsonDecode
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Buat TextEditingController untuk setiap field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  File? _profileImage; // Untuk menyimpan gambar yang dipilih
  bool isEditing = false;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    // Hapus controller setelah widget dibuang
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Token disimpan saat login

    if (token != null) {
      final response = await http.get(
        Uri.parse('https://carwash.diatakasir.com/api/user'),
        headers: {
          'Authorization': 'Bearer $token', // Gunakan token untuk autentikasi
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Set data dari API ke controller masing-masing
        setState(() {
          nameController.text = data['nama_user'];
          phoneController.text = data['no_hp'];
          addressController.text = data['alamat'];
          emailController.text = data['email'];
        });
      } else {
        print('Failed to load user data');
      }
    }
  }

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPasswordScreen()),
              );
            },
            child: const Text(
              'Edit password',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage, // Fungsi untuk memilih gambar
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : AssetImage('assets/images/profile_picture.png'),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(nameController, "Name", isEditing),
            const SizedBox(height: 16),
            _buildTextField(phoneController, "Phone", isEditing),
            const SizedBox(height: 16),
            _buildTextField(addressController, "Address", isEditing),
            const SizedBox(height: 16),
            _buildTextField(emailController, "Email", isEditing),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                  if (!isEditing) {
                    // Save data logic if needed
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 132, 179, 232),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isEditing ? 'Save' : 'Edit',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Fungsi untuk membangun TextField dengan TextEditingController
  Widget _buildTextField(
      TextEditingController controller, String label, bool isEditable) {
    return TextField(
      controller: controller,
      enabled: isEditable,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
