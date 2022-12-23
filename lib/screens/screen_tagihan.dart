import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
import 'package:cafe_sederhana/utils/finite_state.dart';
import 'package:cafe_sederhana/utils/idr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tagihan extends StatefulWidget {
  const Tagihan({super.key});

  @override
  State<Tagihan> createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ProviderPesanan>(context, listen: false).ambilPesanan();
    });
  }

  int subTotal = 0;

  final stl1 = const TextStyle(fontSize: 16, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProviderCustomer>(context, listen: false).user;

    // int jum = 0;
    // // void jumlah() {
    // for (var i in chart) {
    //   // int.parse(i.price);
    //   jum += int.parse(i.price);
    // }
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagihan'),
        centerTitle: true,
      ),
      body: Consumer<ProviderPesanan>(
        builder: (context, provider, _) {
          switch (provider.myState2) {
            // case MyState.loading:
            case MyState.loaded:
              if (provider.daftar.isEmpty) {
                return const Text('Belum Ada Pesanan');
              } else {
                return Column(
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
                                user!.name,
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
                                user.number,
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
                        itemCount: provider.pesanan!.daftarPesanan!.length,
                        itemBuilder: (context, index) {
                          subTotal += provider
                                  .pesanan!.daftarPesanan![index].harga! *
                              provider.pesanan!.daftarPesanan![index].jumlah!;
                          return ListTile(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => DetailPesanan(chart[index]),
                              //   ),
                              // );
                            },
                            title: Text(provider
                                .pesanan!.daftarPesanan![index].nama
                                .toString()),
                            subtitle: Text(
                                'Harga : ${FormatCurrency.convertToIdr(provider.pesanan!.daftarPesanan![index].harga, 0)} x ${provider.pesanan!.daftarPesanan![index].jumlah}'),
                            trailing: Text(
                                'Sub Total : ${FormatCurrency.convertToIdr((provider.pesanan!.daftarPesanan![index].harga! * provider.pesanan!.daftarPesanan![index].jumlah!), 0)}'),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Total : ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            FormatCurrency.convertToIdr(subTotal, 0),
                            style: const TextStyle(fontSize: 16),
                          ),
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
                                onPressed: () {},
                                child: const Text('Sudah'),
                              )
                            ],
                          ),
                        );
                      },
                      child: const Text('Bayar'),
                    ),
                  ],
                );
              }

            case MyState.failed:
              return const Text('Ada Masalah');
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
