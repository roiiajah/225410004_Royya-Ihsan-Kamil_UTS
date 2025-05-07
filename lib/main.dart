import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login_page.dart';

// Titik masuk utama aplikasi Flutter
void main() => runApp(const MyApp());

// Widget root aplikasi yang mengelola tema dan status autentikasi
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variabel state untuk mengecek mode gelap (false = mode terang)
  bool _isDarkMode = false;
  
  // Variabel state untuk mengecek status login (false = belum login)
  bool _isLoggedIn = false;

  // Fungsi untuk toggle antara mode gelap/terang
  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value; // Memperbarui state tema
    });
  }

  // Fungsi yang dipanggil ketika login berhasil
  void _handleLoginSuccess() {
    setState(() {
      _isLoggedIn = true; // Memperbarui status autentikasi
    });
  }

  @override
  Widget build(BuildContext context) {
    // Judul aplikasi yang konstan
    const String appTitle = 'Roy Garage';
    
    return MaterialApp(
      // Konfigurasi dasar aplikasi
      title: appTitle,
      
      // Konfigurasi tema yang merespon state _isDarkMode
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light, // Kecerahan dinamis
        colorSchemeSeed: Colors.deepPurple, // Warna dasar untuk tema
        useMaterial3: true, // Menggunakan desain Material 3
      ),
      
      // Navigasi bersyarat berdasarkan status login
      home: _isLoggedIn
          // Jika sudah login, tampilkan HomePage dengan kontrol tema
          ? HomePage(
              title: appTitle,
              isDarkMode: _isDarkMode,
              onThemeChanged: _toggleDarkMode, // Meneruskan callback toggle tema
            )
          // Jika belum login, tampilkan LoginPage dengan callback sukses
          : LoginPage(onLoginSuccess: _handleLoginSuccess),
    );
  }
}