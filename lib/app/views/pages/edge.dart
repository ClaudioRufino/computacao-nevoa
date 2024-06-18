// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:sistema_inscricao/app/views/components/template.dart';

class Edge extends StatefulWidget {
  const Edge({super.key});

  @override
  State<Edge> createState() => _EdgeState();
}

class _EdgeState extends State<Edge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        tipoBanco: 'mysql',
        tipoArmazenamento: 'Armazenamento na Borda',
        descricaoArmazenamento:
            'O armazenamento nessa seção é a nível da borda',
        corArmazenamento: Colors.blue,
        imagem1: Image.asset('images/fog.png'),
        imagem2: Image.asset('images/edge.png'));
  }
}
