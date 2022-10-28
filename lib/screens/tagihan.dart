import 'package:flutter/material.dart';

class Tagihan extends StatefulWidget {
  const Tagihan({super.key});

  @override
  State<Tagihan> createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagihan'),
        centerTitle: true,
      ),
    );
  }
}
