import 'package:cafe_sederhana/models/model_customer.dart';
import 'package:cafe_sederhana/providers/provider_customer.dart';
import 'package:cafe_sederhana/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    // late SharedPreferences share;

    void shared() async {
      final share = await SharedPreferences.getInstance();
      setState(() {
        share.setString('username', nameController.text);
        share.setString('num', numberController.text);
      });
    }

    void addCustomer() {
      final data = ModelCustomer(
        name: nameController.text,
        number: numberController.text,
      );
      ProviderCustomer().saveCustomer(data);
      // customer.saveCustomer(data);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
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
                key: _formKey,
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
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan Tusliskan Nama Anda';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: '01 - 20',
                        label: Text('Nomor Meja'),
                      ),
                      controller: numberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan Tulis Nomor Meja Anda';
                        } else if (int.parse(value) < 0 ||
                            int.parse(value) > 20) {
                          return 'Masukkan Nomor Meja Yang Benar';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            addCustomer();
                            shared();
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: const Duration(milliseconds: 500),
                                type: PageTransitionType.fade,
                                child: const Screens(),
                              ),
                            );
                          }
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
      ),
    );
  }
}
