import 'package:flutter/material.dart';
import 'package:carwash/models/booking.dart';
import 'package:carwash/models/KategoriLayanan.dart';
import 'package:carwash/models/JenisKendaraan.dart';
import 'package:carwash/controller/jenis_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart'; // Import intl package

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Widget buildCheckboxList(String title, List<bool>? statusList,
      List<String> paketNames, Map<String, int> hargaPaket) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(paketNames.length, (index) {
        final paketName = paketNames[index];
        return CheckboxListTile(
          title: Text(
              '$paketName - ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(hargaPaket[paketName])}'),
          value: statusList![index],
          onChanged: (bool? newValue) {
            setState(() {
              statusList[index] = newValue ?? false;

              // Pastikan selectedPaket tidak null
              selectedPaket ??= [];

              if (newValue == true) {
                // Tambahkan paket ke selectedPaket jika belum ada
                if (!selectedPaket!.contains(paketName)) {
                  selectedPaket!.add(paketName);
                  totalHarga += hargaPaket[paketName]!;
                }
              } else {
                // Hapus paket dari selectedPaket jika ada
                selectedPaket!.remove(paketName);
                totalHarga -= hargaPaket[paketName]!;
              }
            });
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Input Tanggal
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (selectedDate == null) {
                    return 'Tolong pilih tanggal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _platNoController,
                decoration: InputDecoration(
                  labelText: 'Plat No Kendaraan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tolong isi Plat No Kendaraan';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              // Dropdown Jenis Kendaraan
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jenis Kendaraan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                value: selectedJenisKendaraan,
                items: jenisKendaraanList.map((JenisKendaraan jenis) {
                  return DropdownMenuItem<String>(
                    value: jenis.idJenis,
                    child: Text(jenis.jenis),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {});
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tolong pilih Jenis Kendaraan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Dropdown Size Kendaraan
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Size Kendaraan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                value: selectedSizeKendaraan,
                items: sizeKendaraanList.map((SizeKendaraan size) {
                  return DropdownMenuItem<String>(
                    value: size.idSize,
                    child: Text(size.size),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {});
                },
                validator: (value) {
                  if (value == null) {
                    return 'Tolong pilih Size Kendaraan';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Layanan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                value: selectedLayanan,
                items: layananList.map((Layanan layanan) {
                  return DropdownMenuItem<String>(
                    value: layanan
                        .idKategori, // Menggunakan idKategori sebagai value
                    child: Text(layanan
                        .namaKategori), // Menampilkan namaKategori di dropdown
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedLayanan = newValue;

                    // Reset status paket berdasarkan layanan yang dipilih
                    switch (selectedLayanan) {
                      case '1':
                        carwashPaketStatus = List.generate(4, (_) => false);
                        break;
                      case '2':
                        carSalonPaketStatus = List.generate(2, (_) => false);
                        break;
                      case '3':
                        carDetailingPaketStatus =
                            List.generate(2, (_) => false);
                        break;
                      case '4':
                        carGlassPaketStatus = List.generate(1, (_) => false);
                        break;
                      case '5':
                        carCoatingPaketStatus = List.generate(2, (_) => false);
                        break;
                      case '6':
                        motorcycleWashPaketStatus =
                            List.generate(3, (_) => false);
                        break;
                      case '7':
                        motorcycleDetailingPaketStatus =
                            List.generate(2, (_) => false);
                        break;
                      case '8':
                        motorcycleCoatingPaketStatus =
                            List.generate(1, (_) => false);
                        break;
                      default:
                        // Reset status paket jika tidak ada layanan yang dipilih
                        carwashPaketStatus = [];
                        carSalonPaketStatus = [];
                        carDetailingPaketStatus = [];
                        carGlassPaketStatus = [];
                        carCoatingPaketStatus = [];
                        motorcycleWashPaketStatus = [];
                        motorcycleDetailingPaketStatus = [];
                        motorcycleCoatingPaketStatus = [];
                    }
                    // Hitung ulang harga jika diperlukan (misalnya _calculateTotalHarga())
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Tolong pilih Layanan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              Visibility(
                visible: selectedLayanan == '1',
                child: buildCheckboxList(
                    'Paket Carwash',
                    carwashPaketStatus,
                    [
                      'Wash & Wax',
                      'Wash Reguler',
                      'Wash & Jamur Kaca',
                      'Premium Wash'
                    ],
                    carwashPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '2',
                child: buildCheckboxList('Paket Car Salon', carSalonPaketStatus,
                    ['Salon Interior', 'Salon Eksterior'], carSalonPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '3',
                child: buildCheckboxList(
                    'Paket Car Detailing',
                    carDetailingPaketStatus,
                    ['Detailing Interior', 'Detailing Eksterior'],
                    carDetailingPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '4',
                child: buildCheckboxList('Paket Car Glass', carGlassPaketStatus,
                    ['Clean Glass'], carGlassPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '5',
                child: buildCheckboxList(
                    'Paket Car Coating',
                    carCoatingPaketStatus,
                    ['Coating', 'Premium Coating'],
                    carCoatingPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '6',
                child: buildCheckboxList(
                    'Paket Motorcycle Wash',
                    motorcycleWashPaketStatus,
                    ['Wash & Wax', 'Wash Reguler', 'Premium Wash'],
                    motorcycleWashPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '7',
                child: buildCheckboxList(
                    'Paket Motorcycle Detailing',
                    motorcycleDetailingPaketStatus,
                    ['Polish Wax', 'Detailing'],
                    motorcycleDetailingPaketHarga),
              ),

              Visibility(
                visible: selectedLayanan == '8',
                child: buildCheckboxList(
                    'Paket Motorcycle Coating',
                    motorcycleCoatingPaketStatus,
                    ['Coating'],
                    motorcycleCoatingPaketHarga),
              ),
              const SizedBox(height: 16),
              // Dropdown Jam
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jam',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                value: selectedJam,
                items: jamList.map((String jam) {
                  return DropdownMenuItem<String>(
                    value: jam,
                    child: Text(jam),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedJam = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Tolong pilih Jam';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Tampilkan Total Harga
              Text(
                'Total Harga: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(totalHarga)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),
              // Tombol Booking
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Proses booking di sini
                    print('Booking berhasil');
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      Color.fromARGB(255, 168, 209, 243), // Warna teks tombol

                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0), // Padding tombol
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Sudut membulat tombol
                  ),
                ),
                child: const Text(
                  'Book',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0), // Warna teks tombol
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
