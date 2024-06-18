// ignore_for_file: avoid_print

import 'package:sistema_inscricao/app/interfaces/bd.dart';
import 'package:sistema_inscricao/app/models/candidato.dart';

class BancoMysql extends BD {
  @override
  Future<void> addCandidato(Candidato candidato) async {}

  @override
  Future<Object> autenticaticacao(
      {required String email, required String senha}) async {
    return "";
  }

  @override
  Future<void> deleteCandidato({required String id}) async {}

  @override
  Future<String> getCampo({required String campo}) async {
    return "";
  }

  @override
  Future<void> updateCandidato(
      {required String campo, required String valor}) async {}
  // O nosso banco de dados será representado pelo Firestore
}
