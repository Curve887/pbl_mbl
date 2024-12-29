import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_bagoyang/app/modules/home/controllers/home_controller.dart';
import 'package:mie_bagoyang/app/modules/home/views/home_view.dart';
import 'package:mie_bagoyang/app/modules/login/views/login_view.dart';
import 'package:mie_bagoyang/app/modules/main_navigation/views/main_navigation_view.dart';
import 'package:mie_bagoyang/app/modules/register/views/register_view.dart';

// Import halaman SplashScreen (pastikan path benar)
import 'splash_screen.dart';

void main() {
  // Inisialisasi GetX Controller
  Get.put(HomeController());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: '/', // Mulai dari SplashScreen
      getPages: [
        // SplashScreen sebagai halaman pertama
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        // Halaman Login
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        // Halaman Utama setelah login
        GetPage(
          name: '/main_navigation',
          page: () => MainNavigationView(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
        ),
      ],
    ),
  );
}
