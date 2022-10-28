import 'package:cafe_sederhana/screens/screens.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  image: AssetImage('assets/images/Cafe Sederhana.png'),
                ),
              ),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Ahmad',
                      label: Text('Nama'),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Silahkan Tusliskan Nama Lengkap Anda';
                    //   }
                    //   return null;
                    // },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: '01 - 20',
                      label: Text('Nomor Meja'),
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Silahkan Tusliskan Nama Lengkap Anda';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Screens(),
                          ),
                        );
                      },
                      child: const Text(
                        'Lanjut',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
