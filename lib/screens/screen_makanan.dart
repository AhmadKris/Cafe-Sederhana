import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ScreenMakanan extends StatefulWidget {
  const ScreenMakanan({super.key});

  @override
  State<ScreenMakanan> createState() => _MakananState();
}

List coba = [];

class _MakananState extends State<ScreenMakanan> {
  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<ProviderMakanan>(context).list;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimationLimiter(
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
              child: AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: 3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () {
                        Provider.of<ProviderMakanan>(context, listen: false)
                            .addMakan(foods[index]);
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
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
