// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
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
    return const SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

Future<int> inscritos() async {
  final CollectionReference queryUsuarios =
      FirebaseFirestore.instance.collection('usuarios');
  QuerySnapshot querySnapshot = await queryUsuarios.get();
  return querySnapshot.docs.length;
}
