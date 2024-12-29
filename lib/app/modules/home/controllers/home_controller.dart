import 'package:get/get.dart';

class HomeController extends GetxController {
  // Data barang
  final List<Map<String, String>> items = [
    {'name': 'Mie Bagoyang', 'price': '10000', 'image': 'mie_spesial.png'},
    {'name': 'Mie Ayam', 'price': '15000', 'image': 'nasgor.png'},
    {'name': 'Es Teh Manis', 'price': '5000', 'image': 'teh_telur.png'},
    {'name': 'Es Jeruk', 'price': '7000', 'image': 'es_jeruk.png'},
  ];

  // Jumlah barang yang dipilih
  final RxList<int> itemCounts = [0, 0, 0, 0].obs;

  // Hitung total item
  int get totalItems => itemCounts.reduce((a, b) => a + b);

  // Hitung total harga
  int calculateTotal() {
    int total = 0;
    for (int i = 0; i < items.length; i++) {
      final price = int.parse(items[i]['price']!);
      total += price * itemCounts[i];
    }
    return total;
  }

  // Tambah barang
  void incrementItem(int index) {
    itemCounts[index]++;
  }

  // Kurangi barang
  void decrementItem(int index) {
    if (itemCounts[index] > 0) {
      itemCounts[index]--;
    }
  }

  // Ambil barang yang dipesan
  List<Map<String, dynamic>> getSelectedItems() {
    List<Map<String, dynamic>> selectedItems = [];
    for (int i = 0; i < items.length; i++) {
      if (itemCounts[i] > 0) {
        selectedItems.add({
          'name': items[i]['name']!,
          'price': int.parse(items[i]['price']!),
          'count': itemCounts[i],
        });
      }
    }
    return selectedItems;
  }
}
