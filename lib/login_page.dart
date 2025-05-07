import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // Fungsi yang dipanggil ketika login berhasil
  final Function() onLoginSuccess;

  // Konstruktor untuk LoginPage, menerima fungsi onLoginSuccess
  const LoginPage({super.key, required this.onLoginSuccess});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk input username dan password
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variabel untuk menyimpan username dan password yang sudah disimpan sebelumnya
  String? _savedUsername;
  String? _savedPassword;

  // Fungsi untuk menangani proses login
  void _login() {
    final inputUsername = _usernameController.text.trim(); // Ambil dan trim username dari input
    final inputPassword = _passwordController.text; // Ambil password dari input

    if (_savedUsername == null && _savedPassword == null) {
      // Jika ini login pertama kali: simpan username dan password
      setState(() {
        _savedUsername = inputUsername; // Simpan username
        _savedPassword = inputPassword; // Simpan password
      });

      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Akun dibuat dan berhasil login!')),
      );

      // Panggil fungsi onLoginSuccess untuk memberitahu halaman lain bahwa login berhasil
      widget.onLoginSuccess();
    } else if (inputUsername == _savedUsername && inputPassword == _savedPassword) {
      // Jika ini login berikutnya: verifikasi username dan password
      widget.onLoginSuccess(); // Panggil onLoginSuccess jika login berhasil
    } else {
      // Jika username atau password salah, tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // App bar dengan judul 'Login'
      body: Padding(
        padding: const EdgeInsets.all(24), // Padding untuk konten di dalam body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten secara vertikal
          children: [
            // Text field untuk input username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            // Text field untuk input password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true, // Menyembunyikan input password
            ),
            const SizedBox(height: 24), // Spacer vertikal
            // Tombol untuk melakukan login
            ElevatedButton(
              onPressed: _login, // Panggil fungsi _login saat tombol ditekan
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
