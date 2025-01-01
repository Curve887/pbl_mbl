import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mie_bagoyang/app/routes/app_pages.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // Variabel untuk menandakan status loading
  var isLoading = false.obs;

  // Gunakan TextEditingController
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Fungsi untuk login
  Future<void> login() async {
    // Validasi input email dan password
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Email dan password tidak boleh kosong');
      return;
    }

    final url = 'http://192.168.214.70/api/project/login.php';

    try {
      // Set status loading menjadi true
      isLoading(true);

      // Kirim data login dalam format JSON
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          // Simpan token login jika ada
          if (responseData.containsKey('token')) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', responseData['token']);
          }

          // Berikan notifikasi login berhasil
          Get.snackbar('Success', responseData['message']);

          // Arahkan ke halaman MainNavigation dan hapus semua stack navigasi sebelumnya
          Get.offAllNamed(Routes.MAIN_NAVIGATION);
        } else {
          // Tampilkan pesan error jika login gagal
          Get.snackbar('Error', responseData['message']);
        }
      } else {
        Get.snackbar('Error', 'Gagal menghubungi server');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      // Set status loading menjadi false
      isLoading(false);
    }
  }

  // Fungsi untuk membersihkan controller
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
