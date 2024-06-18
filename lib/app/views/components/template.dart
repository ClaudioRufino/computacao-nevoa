// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path_provider/path_provider.dart';

class Template extends StatefulWidget {
  final String tipoArmazenamento;
  final String descricaoArmazenamento;
  final MaterialColor corArmazenamento;
  final Image imagem1;
  final Image imagem2;
  final String tipoBanco;
  const Template(
      {super.key,
      required this.tipoBanco,
      required this.tipoArmazenamento,
      required this.descricaoArmazenamento,
      required this.corArmazenamento,
      required this.imagem1,
      required this.imagem2});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  int totalInscritos = 0;
  TextEditingController nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                      child: Text(
                        'AVALIAÇÃO',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 238, 185, 181),
                        )
                      ],
                    ),
                  ]),
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: widget.corArmazenamento,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.tipoArmazenamento,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(31, 134, 176, 248),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: widget.imagem1,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    surfaceTintColor: const Color.fromARGB(255, 14, 91, 245),
                    color: Colors.white,
                    elevation: 1,
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: widget.imagem2,
                          ),
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              title: const Text(
                                'TYPE OF STORAGE',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                              subtitle: Text(
                                widget.descricaoArmazenamento,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  label: Text(
                    'Digite seu nome',
                    style: TextStyle(
                        fontFamily: 'sans-serif',
                        fontSize: 14,
                        color: widget.corArmazenamento),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    borderSide: BorderSide(color: widget.corArmazenamento),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.corArmazenamento),
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
