import 'package:cafe_sederhana/providers/provider_cemilan.dart';
import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:cafe_sederhana/providers/provider_minuman.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tagihan extends StatefulWidget {
  const Tagihan({super.key});

  @override
  State<Tagihan> createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  // late SharedPreferences share;
  String username = '';

  void getShare() async {
    final share = await SharedPreferences.getInstance();
    setState(() {
      username = share.getString('username') ?? '';
    });
  }

  @override
  void initState() {
    getShare();

    super.initState();
  }

  final stl1 = const TextStyle(fontSize: 16, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProviderCustomer>(context).user;
    final makanan = Provider.of<ProviderMakanan>(context).listMakan;
    final minuman = Provider.of<ProviderMinuman>(context).listMinum;
    final cemilan = Provider.of<ProviderCemilan>(context).listCemilan;

    // final pesanan = Provider.of<ProviderPesanan>(context).listPesanan;
    // print(pesanan.length);

    final chart = []
      ..addAll(makanan)
      ..addAll(minuman)
      ..addAll(cemilan);

    int jum = 0;
    // void jumlah() {
    for (var i in chart) {
      // int.parse(i.price);
      jum += int.parse(i.price);
    }
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagihan'),
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
                      username,
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
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailPesanan(chart[index]),
                    //   ),
                    // );
                  },
                  title: Text(chart.last.name),
                  subtitle: Text('Harga : ${chart[index].price}'),
                  trailing: Text(chart[index].qty.toString()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Total : Rp.'),
                Text(
                  jum.toString(),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Alert !!',
                    textAlign: TextAlign.center,
                  ),
                  content: const Text(
                      'Apakah Anda Sudah Selesai Melakukan Pembayaran ?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Belum'),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<ProviderMakanan>(context, listen: false)
                            .clearData();
                        Provider.of<ProviderMinuman>(context, listen: false)
                            .clearData();
                        Provider.of<ProviderCemilan>(context, listen: false)
                            .clearData();
                        Navigator.pop(context);
                      },
                      child: const Text('Sudah'),
                    )
                  ],
                ),
              );
            },
            child: const Text('Bayar'),
          ),
        ],
      ),
    );
  }
}
