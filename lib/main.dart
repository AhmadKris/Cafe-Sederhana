import 'package:cafe_sederhana/providers/provider_cemilan.dart';
import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/providers/provider_makanan.dart';
import 'package:cafe_sederhana/providers/provider_minuman.dart';
import 'package:cafe_sederhana/providers/provider_pesanan.dart';
import 'package:cafe_sederhana/screens/landing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderMinuman(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderMakanan(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderCustomer(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderCemilan(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderPesanan(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const Landing(),
    );
  }
}
