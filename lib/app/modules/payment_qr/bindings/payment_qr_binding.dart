import 'package:get/get.dart';

import '../controllers/payment_qr_controller.dart';

class PaymentQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentQrController>(
      () => PaymentQrController(),
    );
  }
}
