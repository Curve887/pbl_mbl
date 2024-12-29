import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(); // Local PageController
    final RxInt currentPage = 0.obs; // Local RxInt to track current page

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mie Bagoyang'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 205,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          PageView(
                            controller: pageController,
                            onPageChanged: (int page) {
                              currentPage.value = page;
                            },
                            children: [
                              Image.asset(
                                'assets/images/banner1.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/banner2.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/banner3.jpg',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: currentPage.value == index
                                          ? Colors.white
                                          : Colors.white54,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sections
                  _buildBestSellerSection(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _buildSpecialGrid(),
                  ),
                ],
              ),
            ),
          ),
          _buildPesanSekarangButton(),
        ],
      ),
    );
  }

  Widget _buildBestSellerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Best Seller',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jl. Raya Payakumbuh - Lintau, Lubuk Jantan...',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Order',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialGrid() {
    List<Map<String, String>> items = [
      {
        'name': 'Mie Bagoyang',
        'price': 'Rp. 10.000',
        'image': 'mie_spesial.png'
      },
      {'name': 'Mie Ayam', 'price': 'Rp. 15.000', 'image': 'nasgor.png'},
      {'name': 'Es Teh Manis', 'price': 'Rp. 5.000', 'image': 'teh_telur.png'},
      {'name': 'Es Jeruk', 'price': 'Rp. 7.000', 'image': 'es_jeruk.png'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/${item['image']}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['price']!,
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            controller.decrementItem(index);
                          },
                        ),
                        Obx(() {
                          return Text(
                            '${controller.itemCounts[index]}',
                            style: const TextStyle(fontSize: 16),
                          );
                        }),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            controller.incrementItem(index);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPesanSekarangButton() {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: controller.totalItems > 0
                  ? () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Rincian Pesanan'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Menampilkan rincian pesanan
                              Column(
                                children:
                                    controller.getSelectedItems().map((item) {
                                  return ListTile(
                                    title: Text(item['name']),
                                    subtitle: Text('Jumlah: ${item['count']}'),
                                    trailing: Text(
                                      'Rp ${item['count'] * item['price']}',
                                    ),
                                  );
                                }).toList(),
                              ),
                              const Divider(),
                              // Menampilkan total harga
                              Align(
                                alignment: Alignment.centerRight,
                                child: Obx(() {
                                  return Text(
                                    'Total: Rp. ${controller.calculateTotal()}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Get.back(); // Tutup dialog
                                Get.snackbar(
                                  'Metode Pembayaran',
                                  'Fitur pilih metode pembayaran akan ditambahkan.',
                                );
                              },
                              child: const Text('Pilih Metode Pembayaran'),
                            ),
                          ],
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.totalItems > 0
                    ? Colors.orange
                    : Colors.orange.shade200,
                disabledBackgroundColor: Colors.orange.shade200,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 4,
              ),
              child: Text(
                'Pesan Sekarang',
                style: TextStyle(
                  fontSize: 18,
                  color:
                      controller.totalItems > 0 ? Colors.white : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildRincianPesananModal() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Rincian Pesanan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() {
            return Column(
              children: controller.getSelectedItems().map((item) {
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Jumlah: ${item['count']}'),
                  trailing: Text(
                    'Rp. ${item['count'] * item['price']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            );
          }),
          const Divider(),
          Obx(() {
            return Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Total: Rp. ${controller.calculateTotal()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/payment_method'); // Navigasi ke metode pembayaran
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
