import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Selamat Datang di Mie Bagoyang!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
