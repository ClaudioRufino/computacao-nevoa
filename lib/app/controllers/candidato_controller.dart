// ignore_for_file: unused_local_variable, avoid_print

import 'package:sistema_inscricao/app/models/candidato.dart';
import 'package:sistema_inscricao/app/repositories/banco_firebase.dart';
import 'package:sistema_inscricao/app/repositories/banco_local.dart';
import 'package:sistema_inscricao/app/repositories/banco_mysql.dart';

class CandidatoController {
  late BancoFirebase bancoFirebase = BancoFirebase();
  late BancoMysql bancoMysql = BancoMysql();
  late BancoLocal bancoLocal = BancoLocal();
  // ignore: prefer_typing_uninitialized_variables
  late var banco;

  CandidatoController(String tipoBanco) {
    if (tipoBanco == 'firebase') {
      banco = bancoFirebase;
    }
    else if (tipoBanco == 'mysql') {
      banco = bancoMysql;
    } else if (tipoBanco == 'local') {
      banco = bancoLocal;
    }
  }

  Future<bool> addNome(String nome) async {
    return banco.addNome(nome);
  }

  Future<String> getNome() async {
    return banco.getNome();
  }

  setNome(String nome) {
    Candidato.instancia.setNome(nome);
  }

  setEmail(String email) {
    Candidato.instancia.setEmail(email);
  }

  String getEmail() {
    return Candidato.instancia.getEmail();
  }

  setSenha(String senha) {
    Candidato.instancia.setSenha(senha);
  }

  String getSenha() {
    return Candidato.instancia.getSenha();
  }

  String listar() {
    return Candidato.instancia.getNome();
  }

  void reiniciar() {
    Candidato.instancia.reiniciar();
  }
}
