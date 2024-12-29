import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_qr_controller.dart';

class PaymentQrView extends GetView<PaymentQrController> {
  const PaymentQrView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentQrView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentQrView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
