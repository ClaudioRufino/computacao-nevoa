// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sistema_inscricao/app/views/components/template.dart';

class Cloud extends StatefulWidget {
  const Cloud({super.key});

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        tipoBanco: 'firebase',
        tipoArmazenamento: 'Armazenamento na núvem',
        descricaoArmazenamento:
            'O armazenamento nessa seção é a nível da cloud',
        corArmazenamento: Colors.blue,
        imagem1: Image.asset('images/login-cloud.png'),
        imagem2: Image.asset('images/cloud.png'));
  }
}
