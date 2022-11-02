import 'package:cafe_sederhana/providers/provider_cemilan.dart';
import 'package:flutter/material.dart';
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
    final snacks = Provider.of<ProviderCemilan>(context).list;
    print(snacks);
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
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 150,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(snacks[index].image),
                      ),
                    ),
                  ),
                  Text(snacks[index].name),
                  Text("Rp. ${snacks[index].price}"),
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
