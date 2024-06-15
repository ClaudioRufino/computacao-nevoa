// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:sistema_inscricao/app/views/pages/principal_pages/perfil.dart';
import 'package:sistema_inscricao/app/views/pages/principal_pages/estado.dart';
// import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int indice = 0;
  ValueNotifier<bool> teste = ValueNotifier(false);

  final telas = [const Home(), const Perfil(), const Sobre()];

  int totalInscritos = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: 200).animate(_controller);

    _animation.addListener(() {
      setState(() {
        totalInscritos++;
      });
    });
    // Inicia a animação
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Text('AVALIAÇÃO',
                          style: TextStyle(color: Colors.blue, fontSize: 14)),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star,
                            color: Color.fromARGB(255, 238, 185, 181))
                      ],
                    ),
                  ]),
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'ARMAZENAMENTO LOCAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(31, 43, 116, 242),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Image.asset(
                  'images/local.png',
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    shadowColor: Colors.lightBlue,
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Image.asset('images/nonuvem.gif')),
                          const Expanded(
                              flex: 2,
                              child: ListTile(
                                title: Text(
                                  'TYPE OF STORAGE',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                subtitle: Text(
                                    'O armazenamento nessa seção é a nível do dispositivo'),
                              ))
                        ],
                      ),
                      // decoration: const BoxDecoration(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                  decoration: InputDecoration(
                      label: Text('Digite seu nome'),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)))),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                child: const Text(
                  'Guardar',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
