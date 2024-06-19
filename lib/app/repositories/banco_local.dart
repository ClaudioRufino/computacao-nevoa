// ignore_for_file: avoid_print

import 'package:sistema_inscricao/app/interfaces/bd.dart';
import 'package:sistema_inscricao/app/models/candidato.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BancoLocal extends BD {
  @override
  Future<void> addCandidato(Candidato candidato) async {}

  Future<bool> addNome(String nome) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome);
    return true;
  }

  Future<String> getNome() async {
    final prefs = await SharedPreferences.getInstance();
    final String? nome = prefs.getString('nome');

    if (nome != null) {
      return nome;
    }
    return "Sem nome a mostrar";
  }

  @override
  Future<Object> autenticaticacao(
      {required String email, required String senha}) async {
    return "";
  }

  @override
  Future<void> deleteCandidato({required String id}) async {
    print('');
  }

  @override
  Future<String> getCampo({required String campo}) async {
    return "";
  }

  @override
  Future<void> updateCandidato(
      {required String campo, required String valor}) async {
    print('');
  }
  // O nosso banco de dados será representado pelo Firestore
}
