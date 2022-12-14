import 'package:cafe_sederhana/models/model_pesanan.dart';
import 'package:cafe_sederhana/providers/menu_provider.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
import 'package:cafe_sederhana/utils/finite_state.dart';
// import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ScreenMakanan extends StatefulWidget {
  const ScreenMakanan({super.key});

  @override
  State<ScreenMakanan> createState() => _MakananState();
}

class _MakananState extends State<ScreenMakanan> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, foods, _) {
        switch (foods.myState) {
          case MyState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case MyState.loaded:
            if (foods.makanan.isEmpty) {
              return const Text('Sorry, your data still empty');
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimationLimiter(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemCount: foods.makanan.length,
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
                                  Provider.of<ProviderPesanan>(context,
                                          listen: false)
                                      .tambahPesanan(DaftarPesanan(
                                    nama: foods.makanan[index].nama,
                                    kategori: foods.makanan[index].kategori,
                                    harga: foods.makanan[index].harga,
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
                                          image: NetworkImage(foods
                                              .makanan[index].gambar
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                    Text(foods.makanan[index].nama.toString()),
                                    Text("Rp. ${foods.makanan[index].harga}"),
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
                ),
              );
            }
          case MyState.failed:
            return const Text('Oops, something went wrong!');
          default:
            return const SizedBox();
        }
      },
    );
  }
}
