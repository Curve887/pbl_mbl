import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mie_bagoyang/app/modules/login/views/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [ 
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 8),
            Text(
              '',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bagian Akun Saya
            Text(
              'Akun Saya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            Divider(),
            // Menu Metode Pembayaran
            _buildMenuItem('Metode Pembayaran', Icons.payment, context, PaymentMethodsPage()),
            _buildMenuItem('Alamat Tersimpan', Icons.home, context, StoredAddressesPage()),
            _buildMenuItem('Kontak Darurat', Icons.contact_phone, context, EmergencyContactsPage()),
            _buildMenuItem('Pusat Bisnis', Icons.business, context, BusinessCenterPage()),
            SizedBox(height: 20),
            // Bagian Umum
            Text(
              'Umum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            Divider(),
            // Menu Umum
            _buildMenuItem('Pusat Bantuan', Icons.help, context, HelpCenterPage()),
            _buildMenuItem('Bahasa', Icons.language, context, LanguagePage()),
            _buildMenuItem('Pengaturan', Icons.settings, context, SettingsPage()),
            SizedBox(height: 20),
            // Tombol Logout
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat menu item
  Widget _buildMenuItem(String title, IconData icon, BuildContext context, Widget nextPage) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Tindakan saat item dipilih
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
    );
  }

  // Fungsi untuk membuat tombol logout
  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.orange),
      title: Text(
        'Logout',
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        // Tindakan saat Logout dipilih
        _showLogoutDialog(context);
      },
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Apakah Anda yakin ingin logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Menutup dialog
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Menutup dialog
            // Navigasi menggunakan GetX ke halaman login
            Get.offAll(() => const LoginView());
          },
          child: const Text('Ya'),
        ),
      ],
    );
  },
);

  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Halaman Login'),
      ),
    );
  }
}

// Halaman untuk metode pembayaran
class PaymentMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dompet Digital'),
            onTap: () {
              print('Dompet Digital selected');
            },
          ),
          ListTile(
            title: Text('COD'),
            onTap: () {
              print('COD selected');
            },
          ),
        ],
      ),
    );
  }
}

// Halaman untuk alamat tersimpan
class StoredAddressesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat Tersimpan'),
      ),
      body: Center(
        child: Text('Daftar alamat tersimpan Anda akan tampil di sini.'),
      ),
    );
  }
}

// Halaman untuk kontak darurat
class EmergencyContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Darurat'),
      ),
      body: Center(
        child: Text('Daftar kontak darurat akan tampil di sini.'),
      ),
    );
  }
}

// Halaman untuk pusat bisnis
class BusinessCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Bisnis'),
      ),
      body: Center(
        child: Text('Informasi pusat bisnis akan tampil di sini.'),
      ),
    );
  }
}

// Halaman untuk pusat bantuan
class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Bantuan'),
      ),
      body: Center(
        child: Text('Informasi pusat bantuan akan tampil di sini.'),
      ),
    );
  }
}

// Halaman untuk pengaturan bahasa
class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bahasa'),
      ),
      body: Center(
        child: Text('Pengaturan bahasa akan tampil di sini.'),
      ),
    );
  }
}

// Halaman untuk pengaturan
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Center(
        child: Text('Pengaturan aplikasi akan tampil di sini.'),
      ),
    );
  }
}
