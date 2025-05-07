import 'package:flutter/material.dart';

// Halaman detail untuk motor Yamaha R15M
class R15MDetailPage extends StatelessWidget {
  const R15MDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul halaman
      appBar: AppBar(
        title: const Text('R15M Detail'),
      ),
      
      // Body menggunakan SingleChildScrollView agar konten bisa di-scroll
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // Padding 16px di semua sisi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk kolom
          children: [
            // Judul model dan tahun dengan style tebal
            const Text(
              '2025\nYamaha R15M',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // Jarak vertikal 8px
            
            // Harga motor dengan warna abu-abu
            const Text(
              'MSRP Rp 45.700.000 (Jakarta)',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24), // Jarak vertikal lebih besar (24px)
            
            // Header untuk fitur tambahan
            const Text(
              'FITUR TAMBAHAN:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8), // Jarak vertikal 8px
            
            // Daftar fitur menggunakan Column dengan ListTile
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Masing-masing fitur menggunakan ListTile dengan icon centang hijau
                ListTile(
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text('Tampilan ala supersport dengan DNA R-Series'),
                ),
                ListTile(
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text('Assist & Slipper Clutch'),
                ),
                ListTile(
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text('Traction Control System'),
                ),
                ListTile(
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text('Quick Shifter (upshift only)'),
                ),
                ListTile(
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text('Upside Down Front Suspension'),
                ),
                ListTile(
                  leading: Icon(Icons.check, color: Colors.green),
                  title: Text('Full Digital Speedometer dengan Lap Timer'),
                ),
              ],
            ),
            const SizedBox(height: 20), // Jarak vertikal 20px
            
            // Gambar motor di tengah dengan tinggi 220px
            Center(
              child: Image.asset('images/r15m.png', height: 220),
            ),
          ],
        ),
      ),
    );
  }
}