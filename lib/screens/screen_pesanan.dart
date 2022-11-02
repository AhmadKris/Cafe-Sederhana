import 'package:cafe_sederhana/models/model_customer.dart';
import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenPesanan extends StatefulWidget {
  const ScreenPesanan({super.key});

  @override
  State<ScreenPesanan> createState() => _PesananState();
}

class _PesananState extends State<ScreenPesanan> {
  final stl1 = const TextStyle(fontSize: 16, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final chart = Provider.of<ProviderMakanan>(context, listen: false).list;
    // final user = Provider.of<ProviderCustomer>(context).users;

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
                      'Ahmad',
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
          Column(
            children: [
              Text('Daftar Pesanan'),
              // ListView.builder(
              //   itemCount: chart.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(chart[index].name),
              //     );
              //   },
              // ),
              for (var i in chart) Text(i.name)
            ],
          ),
        ],
      ),
    );
  }
}
