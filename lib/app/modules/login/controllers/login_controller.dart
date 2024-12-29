import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  // Menyimpan nilai count
  final count = 0.obs;

  // Variabel untuk menandakan status loading
  var isLoading = false.obs;

  // Fungsi untuk login
  Future<void> login(String email, String password) async {
    final url = 'http://10.127.249.128/api/project/login.php'; // Ganti dengan URL API Anda

    try {
      // Set status loading menjadi true
      isLoading(true);

      // Kirim data login dalam format JSON
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      // Proses response dari server
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          // Login berhasil
          Get.snackbar('Success', responseData['message']);
          // Navigasi ke halaman utama setelah login berhasil
          Get.toNamed('/main_navigation');
        } else {
          // Tampilkan pesan error jika login gagal
          Get.snackbar('Error', responseData['message']);
        }
      } else {
        Get.snackbar('Error', 'Gagal menghubungi server');
      }
    } catch (e) {
      // Tangani error lainnya
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      // Set status loading menjadi false setelah proses selesai
      isLoading(false);
    }
  }

  // Fungsi untuk menambah nilai count (fungsi tidak terkait login)
  void increment() => count.value++;
}
