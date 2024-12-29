import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Metode Pembayaran'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.blue),
              title: const Text('Dompet Digital'),
              onTap: () {
                // Aksi ketika Dompet Digital dipilih
                Get.snackbar('Pembayaran', 'Pembayaran menggunakan Dompet Digital dipilih');
                // Arahkan ke halaman konfirmasi pembayaran atau proses pembayaran lebih lanjut
                Get.back();
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.qr_code, color: Colors.green),
              title: const Text('Qsir'),
              onTap: () {
                // Aksi ketika Qsir dipilih
                Get.snackbar('Pembayaran', 'Pembayaran menggunakan Qsir dipilih');
                // Arahkan ke halaman konfirmasi pembayaran atau proses pembayaran lebih lanjut
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
