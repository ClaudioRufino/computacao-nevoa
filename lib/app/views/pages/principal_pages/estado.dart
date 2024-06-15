// ignore_for_file: unused_import, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/repositories/db_repository.dart';
// import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  // final AutenticacaoServico _authServico = AutenticacaoServico();
  DbRepository db = DbRepository();

  late String idCandidato;

  @override
  void initState() {
    super.initState();
    var userCandidato = db.getCandidatoAtivo();
    // print("Teste $teste");
    userCandidato.then((user) {
      idCandidato = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 80,
          alignment: Alignment.bottomCenter,
          color: const Color.fromARGB(255, 24, 56, 97),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'ESTADO DE PAGAMENTO',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Divider(),
        const SizedBox(height: 250),
        Container(
          width: 360,
          height: 120,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: const ListTile(
            title: Text(
              'MEU ESTADO',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            subtitle: Text('PENDENTE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.redAccent)),
          ),
        ),
      ]),
      // child: const Center(
      //   child: Text('Home'),
      // ),
    );
  }
}
