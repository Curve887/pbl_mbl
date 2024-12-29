import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_bagoyang/app/modules/home/views/home_view.dart';
import 'package:mie_bagoyang/app/modules/order/views/order_view.dart';
import 'package:mie_bagoyang/app/modules/order_minuman/views/order_minuman_view.dart';
import 'package:mie_bagoyang/app/modules/profil/views/profil.dart';
import 'package:mie_bagoyang/app/shared/theme.dart';
import '../controllers/main_navigation_controller.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  MainNavigationView({super.key}) {
    Get.put(MainNavigationController());
  }

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(MainNavigationController());

    return Scaffold(
      body: Obx(() {
        switch (navigationController.selectedIndex.value) {
          case 0:
            return const HomeView();
          case 1:
            return const OrderView();
          case 2:
            return const OrderMinumanView();
          case 3:
            return const AccountPage(); // Tambahkan AccountPage di sini
          default:
            return const Center(
              child: Text("Page not found!"),
            );
        }
      }),
      bottomNavigationBar: Obx(
        () => Container(
          height: 72,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            color: secondary,
          ),
          child: BottomNavigationBar(
            currentIndex: navigationController.selectedIndex.value,
            onTap: navigationController.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), // Ganti ikon dengan ikon makanan
                label: 'Makanan', // Ganti label menjadi "Makanan"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_drink), label: 'Minuman'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primary,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
