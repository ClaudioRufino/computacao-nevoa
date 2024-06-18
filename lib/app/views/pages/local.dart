// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:sistema_inscricao/app/views/components/template.dart';

class Local extends StatefulWidget {
  const Local({super.key});

  @override
  State<Local> createState() => _LocalState();
}

class _LocalState extends State<Local> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        tipoBanco: 'local',
        tipoArmazenamento: 'Armazenamento Local',
        descricaoArmazenamento:
            'O armazenamento nessa seção é a nível do dispositivo',
        corArmazenamento: Colors.red,
        imagem1: Image.asset('images/local.png'),
        imagem2: Image.asset('images/local.png'));
  }
}
