import 'package:get/get.dart';

import '../controllers/order_minuman_controller.dart';

class OrderMinumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderMinumanController>(
      () => OrderMinumanController(),
    );
  }
}
