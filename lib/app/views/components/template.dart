// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sistema_inscricao/app/controllers/candidato_controller.dart';
import 'package:sistema_inscricao/app/views/components/mensagem.dart';

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
  TextEditingController nomeController = TextEditingController();
  late CandidatoController candidato;
  final _keyForm = GlobalKey<FormState>();

  var conteudo = "";

  @override
  void initState() {
    super.initState();
  }

  bool nomeGuardado = false;
  bool verConteudo = false;
  void mensagemSucesso() {
    setState(() {
      nomeGuardado = true;
      verConteudo = false;
    });
  }

  void verContent() {
    setState(() {
      verConteudo = true;
      nomeGuardado = false;
    });
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
              padding: const EdgeInsets.only(top: 4, right: 4),
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  child: const Text(
                    'Ver Conteudo',
                    style: TextStyle(
                        backgroundColor: Colors.blue, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () async {
                    if (widget.tipoBanco == 'local') {
                      candidato = CandidatoController('local');
                      conteudo = await candidato.getNome();
                      verContent();
                    }
                  },
                ),
              ),
            ),
            Visibility(
              visible: verConteudo,
              child: StreamBuilder<int>(
                stream: tempo2(),
                builder: (context, AsyncSnapshot<int> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container();
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return SizedBox(
                        width: double.infinity,
                        child: Center(
                            child: Text(conteudo,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'monospace',
                                    color: widget.corArmazenamento))),
                      );
                    case ConnectionState.done:
                      return const Center();
                  }
                },
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: TextFormField(
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
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: nomeGuardado,
                    child: StreamBuilder<int>(
                      stream: tempo(),
                      builder: (context, AsyncSnapshot<int> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Container();
                          case ConnectionState.waiting:
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          case ConnectionState.active:
                            return const Mensagem(
                              cor: Colors.red,
                              texto: 'Nome Guardado com sucesso!!',
                            );
                          case ConnectionState.done:
                            return const Center();
                        }
                        // return Container();
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (widget.tipoBanco == 'local') {
                        candidato = CandidatoController('local');
                        var guardar =
                            await candidato.addNome(nomeController.text);
                        if (guardar == true) {
                          mensagemSucesso();
                        }
                      } else if (widget.tipoBanco == 'firebase') {
                        candidato = CandidatoController('firebase');
                        var guardar =
                            await candidato.addNome(nomeController.text);
                        if (guardar == true) {
                          mensagemSucesso();
                        }
                      } else if (widget.tipoBanco == 'mysql') {
                        candidato = CandidatoController('mysql');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: widget.corArmazenamento),
                    child: const Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white, fontSize: 14),
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

Stream<int> tempo() async* {
  int i;
  for (i = 0; i < 4; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

Stream<int> tempo2() async* {
  int i;
  for (i = 0; i < 4; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
