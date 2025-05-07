import 'package:flutter/material.dart';
import 'r15m.dart';
import 'cbr250rr.dart';
import 'r6.dart';

// Halaman utama yang menampilkan daftar motor
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,        // Judul aplikasi
    required this.isDarkMode,   // Status mode gelap
    required this.onThemeChanged, // Callback untuk mengubah tema
  });

  final String title;
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

// Kelas model untuk data motor
class Motorcycle {
  final String name;      // Nama motor
  final String price;     // Harga motor
  final String imagePath; // Path gambar motor

  Motorcycle({required this.name, required this.price, required this.imagePath});
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _drawerAnimationController; // Controller untuk animasi drawer

  // Daftar motor yang akan ditampilkan
  final List<Motorcycle> motorcycles = [
    Motorcycle(name: 'R15M', price: 'Rp 45.700.000', imagePath: 'images/r15m.png'),
    Motorcycle(name: 'CBR250RR', price: 'Rp 76.700.000', imagePath: 'images/cbr250rr.png'),
    Motorcycle(name: 'R6', price: 'Rp 270.000.000', imagePath: 'images/r6.png'),
  ];

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller animasi dengan durasi 300ms
    _drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  // Fungsi untuk membuka drawer dari sisi kanan
  void _openEndDrawer(BuildContext context) {
    _drawerAnimationController.forward(from: 0);
    Scaffold.of(context).openEndDrawer();
  }

  @override
  void dispose() {
    _drawerAnimationController.dispose(); // Membersihkan controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // Tombol menu untuk membuka drawer
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _openEndDrawer(context),
            ),
          ),
        ],
      ),
      // Drawer di sisi kanan dengan animasi
      endDrawer: Drawer(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.9, end: 1.0), // Animasi scaling dari 90% ke 100%
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack, // Jenis kurva animasi
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              alignment: Alignment.topRight,
              child: child,
            );
          },
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Header drawer
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: const Center(
                    child: Text(
                      '225410004\nRoyya Ihsan Kamil',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                // Menu panggilan
                ListTile(
                  leading: const Icon(Icons.call),
                  title: const Text('CALL'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Calling...')),
                    );
                  },
                ),
                // Menu rute
                ListTile(
                  leading: const Icon(Icons.near_me),
                  title: const Text('ROUTE'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Routing...')),
                    );
                  },
                ),
                // Menu berbagi
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('SHARE'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sharing...')),
                    );
                  },
                ),
                const Divider(),
                // Toggle mode gelap/terang
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: widget.isDarkMode,
                  secondary: const Icon(Icons.brightness_6),
                  onChanged: widget.onThemeChanged,
                ),
              ],
            ),
          ),
        ),
      ),
      // Body berisi list motor
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: motorcycles.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20), // Jarak antar item
          itemBuilder: (context, index) {
            final bike = motorcycles[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Gambar motor
                    Expanded(
                      flex: 4,
                      child: Image.asset(bike.imagePath, height: 100),
                    ),
                    const SizedBox(width: 16),
                    // Informasi motor
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bike.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'OTR Jakarta, Mulai Dari',
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bike.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Tombol detail
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Navigasi ke halaman detail sesuai motor yang dipilih
                            if (bike.name == 'R15M') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const R15MDetailPage()),
                              );
                            } else if (bike.name == 'CBR250RR') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CBR250RRSPQSDetailPage()),
                              );
                            } else if (bike.name == 'R6') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const R6DetailPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Details for ${bike.name}')),
                              );
                            }
                          },
                          child: const Text(
                            'Details',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}