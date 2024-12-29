import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mie_bagoyang/app/shared/theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Ruang di atas layar
                Image.asset(
                  'assets/images/mie_login.png',
                  width: 335,
                  height: 309,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Go 🍴 Mieyang',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true, // Aktifkan warna latar belakang
                    fillColor: secondary, // Warna latar belakang
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true, // Aktifkan warna latar belakang
                    fillColor: Color(0xFFD9D9D9), // Warna latar belakang
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan navigasi untuk login
                    Get.toNamed('/main_navigation');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 4, 4, 4)),
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Log in with',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.g_mobiledata),
                      color: Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Tambahkan navigasi untuk sign up
                    Get.toNamed('/register');
                  },
                  child: const Text(
                    'No account? sign up',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Ruang di bawah layar
              ],
            ),
          ),
        ),
      ),
    );
  }
}
