import 'package:flutter/material.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  final stl1 = const TextStyle(fontSize: 16, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Nama :',
                      style: stl1,
                    ),
                    Text(
                      ' Ahmad',
                      style: stl1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'No. Meja :',
                      style: stl1,
                    ),
                    Text(
                      ' 10',
                      style: stl1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
