import 'package:flutter/material.dart';

class R6DetailPage extends StatelessWidget {
  const R6DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yamaha R6'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '2023 Yamaha YZF-R6',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'MSRP: Rp 270.000.000',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Image.asset('images/r6.png'), 
            const SizedBox(height: 24),
            const Text(
              'FITUR TAMBAHAN:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const BulletPoint(text: '599cc DOHC inline 4-cylinder engine'),
            const BulletPoint(text: 'YCC-T and YCC-I throttle control system'),
            const BulletPoint(text: 'Advanced traction control system'),
            const BulletPoint(text: 'Deltabox aluminum frame'),
            const BulletPoint(text: 'Aerodynamic fairings'),
            const BulletPoint(text: 'Quick Shifter System (QSS)'),
            const BulletPoint(text: 'Fully adjustable KYB suspension'),
            const BulletPoint(text: 'ABS dual front 320mm discs'),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('• ', style: TextStyle(fontSize: 18)),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
