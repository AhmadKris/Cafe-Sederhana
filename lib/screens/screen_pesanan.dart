import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
import 'package:cafe_sederhana/utils/finite_state.dart';
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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ProviderCustomer>(context, listen: false).getUser();
    });
  }

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
            child: Consumer<ProviderCustomer>(
              builder: (context, user, _) {
                switch (user.myState2) {
                  case MyState.loading:
                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  case MyState.loaded:
                    if (user.user == null) {
                      return const Text('Sorry, your data still empty');
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Nama :',
                                style: stl1,
                              ),
                              Text(
                                user.user!.name,
                                // "haa",
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
                                user.user!.number,
                                // "js",
                                style: stl1,
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  case MyState.failed:
                    return const Text('Oops, something went wrong!');
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
          const Text(
            'Daftar Pesanan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Consumer<ProviderPesanan>(
              builder: (context, provider, _) {
                switch (provider.myState) {
                  // case MyState.loading:

                  case MyState.loaded:
                    if (provider.daftar.isEmpty) {
                      return const Text('Belum Ada Pesanan');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.daftar.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(provider.daftar[index].nama.toString()),
                            subtitle: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // provider.daftar[index].jumlah =
                                    //     (provider.daftar[index].jumlah! - 1);
                                    setState(() {
                                      if (provider.daftar[index].jumlah! > 1) {
                                        provider.daftar[index].jumlah =
                                            provider.daftar[index].jumlah! - 1;
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 16,
                                  ),
                                ),
                                Text(
                                  provider.daftar[index].jumlah.toString(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      provider.daftar[index].jumlah =
                                          (provider.daftar[index].jumlah! + 1);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<ProviderPesanan>(context,
                                        listen: false)
                                    .hapusPesanan(provider.daftar[index]);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          );
                        },
                      );
                    }
                  case MyState.failed:
                    return const Text('Ada Masalah');
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final user =
                    Provider.of<ProviderCustomer>(context, listen: false).user;
                final daftar =
                    Provider.of<ProviderPesanan>(context, listen: false).daftar;
                if (daftar.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Maaf Pesanan Anda Masih Kosong',
                      ),
                    ),
                  );
                } else {
                  Provider.of<ProviderPesanan>(context, listen: false)
                      .buatPesanan(
                    PesananModel(
                        namaCustomer: user!.name,
                        nomorMeja: user.number,
                        daftarPesanan: daftar),
                  );
                }
              },
              child: const Text('Pesan')),
        ],
      ),
    );
  }
}
