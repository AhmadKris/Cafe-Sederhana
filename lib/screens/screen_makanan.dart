import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
    final foods = Provider.of<ProviderMakanan>(context).list;
    print(foods);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: InkWell(
              onTap: () {
                // ProviderMakanan().addFood(foods[index]);
              },
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 150,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(foods[index].image),
                      ),
                    ),
                  ),
                  Text(foods[index].name),
                  Text("Rp. ${foods[index].price}"),
                  // ignore: deprecated_member_use
                  const FaIcon(FontAwesomeIcons.shoppingCart),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
