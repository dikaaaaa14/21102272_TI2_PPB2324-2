import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
 final String? data;
 // Mengubah key menjadi parameter konstruktor
 @override
  // ignore: overridden_fields
  final Key? key;

 // Menambahkan parameter key ke konstruktor
 const SecondPage({this.key, this.data}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    final data2 = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: const Color.fromARGB(255, 54, 136, 244),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data ?? '', style: const TextStyle(fontSize: 20.0),),
            Text(
              data2.toString(),
              style: const TextStyle(fontSize: 20.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
 }
}