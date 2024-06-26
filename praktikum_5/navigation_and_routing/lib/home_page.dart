import 'package:flutter/material.dart';

import 'second_page.dart';

class HomePage extends StatelessWidget {
 // Mengubah key menjadi parameter konstruktor
 @override
  final Key? key;

 // Menambahkan parameter key ke konstruktor
 const HomePage({this.key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: const Color.fromARGB(255, 54, 136, 244),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                 context,
                 MaterialPageRoute(
                    builder: (context) => const SecondPage(data: 'Data dari Home Page',),
                 ),
                );
              },
              child: const Text('Menuju halaman kedua'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second_page', arguments: 'Menggunakan route');
              },
              child: const Text('Menuju halaman kedua dengan route'),
            ),
          ],
        ),
      ),
    );
 }
}