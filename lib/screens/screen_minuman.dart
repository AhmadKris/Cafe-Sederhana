import 'package:cafe_sederhana/providers/provider_minuman.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ScreenMinuman extends StatefulWidget {
  const ScreenMinuman({super.key});

  @override
  State<ScreenMinuman> createState() => _MinumanState();
}

class _MinumanState extends State<ScreenMinuman> {
  @override
  Widget build(BuildContext context) {
    final drinks = Provider.of<ProviderMinuman>(context).list;
    print(drinks);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.3,
        ),
        itemCount: drinks.length,
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
                        image: NetworkImage(drinks[index].image),
                      ),
                    ),
                  ),
                  Text(drinks[index].name),
                  Text("Rp. ${drinks[index].price}"),
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
