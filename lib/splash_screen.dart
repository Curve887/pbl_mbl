import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigasi ke halaman login
    Future.delayed(Duration(seconds: 4), () {
      Get.offNamed('/login');
    });

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo dengan animasi Scale
            Icon(
              Icons.fastfood,
              size: 100,
              color: Colors.white,
            )
                .animate()
                .scale(duration: 1000.ms, curve: Curves.easeInOut)
                .then() // Setelah animasi Scale
                .shake(duration: 500.ms), // Tambahkan efek goyang ringan

            SizedBox(height: 20),

            // Teks dengan animasi Fade dan Move Up
            Text(
              'Go  🍜 Mieyang', // Menggunakan emoji sebagai simbol mie
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
                .animate()
                .fadeIn(duration: 1200.ms)
                .moveY(begin: 50, end: 0, curve: Curves.easeOut)
                .then() // Animasi tambahan setelah fade in
                .scale(duration: 500.ms, curve: Curves.easeInOut),

            SizedBox(height: 30),

            // Animasi teks berjalan atau efek lainnya
            Text(
              'Sedang Menunggu...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
              ),
            )
                .animate()
                .slideX(begin: -100, end: 0, duration: 1000.ms, curve: Curves.easeInOut),
          ],
        ),
      ),
    );
  }
}
