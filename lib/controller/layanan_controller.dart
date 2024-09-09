import 'package:flutter/material.dart';
import 'package:carwash/models/KategoriLayanan.dart'; // Ensure this path is correct
import 'package:carwash/api/config.dart'; // Import Api class

class LayananController with ChangeNotifier {
  List<Layanan> _layananList = [];
  bool _isLoading = true;

  List<Layanan> get layananList => _layananList;
  bool get isLoading => _isLoading;

  final Api _api = Api(); // Initialize Api instance

  LayananController() {
    fetchLayanan(); // Fetch data when controller is created
  }

  Future<void> fetchLayanan() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Layanan> layananData =
          await _api.fetchLayanan(); // Call fetchLayanan from Api
      _layananList = layananData;
    } catch (e) {
      print('Failed to load layanan: $e');
      _layananList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
