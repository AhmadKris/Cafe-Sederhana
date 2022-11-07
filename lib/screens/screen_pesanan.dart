import 'package:cafe_sederhana/providers/provider_cemilan.dart';
import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:cafe_sederhana/providers/provider_minuman.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
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
    final user = Provider.of<ProviderCustomer>(context).user;
    final makanan = Provider.of<ProviderMakanan>(context).listMakan;
    final minuman = Provider.of<ProviderMinuman>(context).listMinum;
    final cemilan = Provider.of<ProviderCemilan>(context).listCemilan;

    final chart = []
      ..addAll(makanan)
      ..addAll(minuman)
      ..addAll(cemilan);

    List<Map<String, String>> listItem = <Map<String, String>>[];
    for (var element in chart) {
      Map<String, String> val = {
        'nama': element.name.toString(),
        'harga': element.price.toString(),
        'jumlah': element.qty.toString(),
      };
      listItem.add(val);
    }
    Map data = {
      'customer': user.last.name,
      'nomor meja': user.last.number,
      'items': listItem,
    };

    // void _addPost() {
    //   // final List<ModelMakanan> data;
    //   // var data;
    //   for (var element in chart) {
    //     var items = ModelMakanan(
    //         id: element.id,
    //         name: element.name,
    //         image: element.image,
    //         price: element.price,
    //         qty: element.qty);

    //     Provider.of<ProviderMakanan>(context, listen: false).saveOrder(items);
    //   }
    // }

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
                      user.last.name,
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
                      user.last.number,
                      style: stl1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            'Daftar Pesanan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Edit',
                          textAlign: TextAlign.center,
                        ),
                        // content: Text(chart[index].qty.toString()),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                          Text(chart[index].qty.toString()),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  },
                  title: Text(chart[index].name),
                  subtitle: Text(
                    chart[index].qty.toString(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Provider.of<ProviderMakanan>(context, listen: false)
                          .deleteMakanan(chart[index]);
                      Provider.of<ProviderMinuman>(context, listen: false)
                          .deleteMinuman(chart[index]);
                      Provider.of<ProviderCemilan>(context, listen: false)
                          .deleteCemilan(chart[index]);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // _addPost();
                Provider.of<ProviderPesanan>(context, listen: false)
                    .saveOrder(data);
              },
              child: const Text('Pesan'))
        ],
      ),
    );
  }
}
