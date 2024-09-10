import 'package:flutter/material.dart';
import 'package:carwash/widget/custom_bottom_nav_bar.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final TextEditingController passwordController =
      TextEditingController(text: "");

  bool isEditing = false; // State to track if the user is editing
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(passwordController, "Password saat ini", isEditing),
            const SizedBox(height: 16),
            _buildTextField(passwordController, "Password baru", isEditing),
            const SizedBox(height: 16),
            _buildTextField(
                passwordController, "Ulang Password baru", isEditing),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing; // Toggle editing mode
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 132, 179, 232),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTextField(
      TextEditingController controller, String label, bool isEditable) {
    return TextField(
      controller: controller,
      enabled: isEditable, // Enable or disable editing based on the state
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
