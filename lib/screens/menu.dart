import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: FaIcon(FontAwesomeIcons.utensils),
              child: Text('Makanan'),
            ),
            Tab(
              // ignore: deprecated_member_use
              icon: FaIcon(FontAwesomeIcons.coffee),
              child: Text('Minuman'),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.cookieBite),
              child: Text('Cemilan'),
            ),
          ]),
        ),
        body: const TabBarView(children: []),
      ),
    );
  }
}
