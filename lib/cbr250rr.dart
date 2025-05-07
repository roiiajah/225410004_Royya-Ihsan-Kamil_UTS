import 'package:flutter/material.dart';

// Halaman detail untuk motor CBR250RR SP QS
class CBR250RRSPQSDetailPage extends StatelessWidget {
  const CBR250RRSPQSDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul model motor
      appBar: AppBar(
        title: const Text('CBR250RR SP QS'),
      ),
      
      // Body menggunakan SingleChildScrollView agar bisa discroll
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Padding di semua sisi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk kolom
          children: [
            // Judul model dan tahun
            const Text(
              '2025\nCBR250RR SP QS',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Spasi vertikal
            
            // Harga motor
            const Text(
              'MSRP Rp 76.700.000 (JAKARTA)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // Warna abu-abu
              ),
            ),
            const SizedBox(height: 16), // Spasi vertikal lebih besar
            
            // Header untuk fitur tambahan
            const Text(
              'FITUR TAMBAHAN:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8), // Spasi vertikal
            
            // Daftar fitur menggunakan widget FeatureBullet
            const FeatureBullet(text: 'Quick Shifter 2 arah (naik & turun gigi)'),
            const FeatureBullet(text: 'Assist & Slipper Clutch'),
            const FeatureBullet(text: 'Throttle by Wire (TBW)'),
            const FeatureBullet(text: '3 Riding Modes: Comfort, Sport, Sport+'),
            const FeatureBullet(text: 'Lampu depan LED ganda dengan DRL'),
            const FeatureBullet(text: 'Suspensi depan USD Showa SFF-BP'),
            const FeatureBullet(text: 'Panel Meter Full Digital dengan Lap Timer'),
            const FeatureBullet(text: 'Desain Fairing Aerodinamis'),
            const FeatureBullet(text: 'Desain Knalpot Ganda Khas CBR'),
            
            const SizedBox(height: 24), // Spasi vertikal lebih besar
            
            // Gambar motor di tengah
            Center(
              child: Image.asset(
                'images/cbr250rr.png', // Path gambar
                width: 300, // Lebar gambar
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget custom untuk menampilkan fitur dengan bullet point
class FeatureBullet extends StatelessWidget {
  final String text; // Teks fitur yang akan ditampilkan
  
  const FeatureBullet({
    super.key,  // Parameter key untuk identifikasi widget
    required this.text, // Teks wajib diisi
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Rata atas untuk baris
      children: [
        // Bullet point
        const Text('• ', style: TextStyle(fontSize: 18)),
        
        // Teks fitur yang bisa panjang (menggunakan Expanded)
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}