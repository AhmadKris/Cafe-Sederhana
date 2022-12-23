import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:cafe_sederhana/providers/menu_provider.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ScreenCemilan extends StatefulWidget {
  const ScreenCemilan({super.key});

  @override
  State<ScreenCemilan> createState() => _CemilanState();
}

class _CemilanState extends State<ScreenCemilan> {
  @override
  Widget build(BuildContext context) {
    final snacks = Provider.of<MenuProvider>(context).cemilan;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount: snacks.length,
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 500),
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: InkWell(
                    onTap: () {
                      Provider.of<ProviderPesanan>(context, listen: false)
                          .tambahPesanan(DaftarPesanan(
                        nama: snacks[index].nama,
                        kategori: snacks[index].kategori,
                        harga: snacks[index].harga,
                        jumlah: 1,
                      ));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 150,
                            child: Image(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(snacks[index].gambar.toString()),
                            ),
                          ),
                        ),
                        Text(snacks[index].nama.toString()),
                        Text("Rp. ${snacks[index].harga}"),
                        // ignore: deprecated_member_use
                        const FaIcon(FontAwesomeIcons.shoppingCart),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
