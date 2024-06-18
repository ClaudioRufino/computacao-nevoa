import 'package:sistema_inscricao/app/models/candidato.dart';

abstract class BD {
  Future<Object> autenticaticacao(
      {required String email, required String senha});

  Future<void> addCandidato(Candidato candidato);

  Future<void> deleteCandidato({required String id});

  // Future<Object> getCandidatoAtivo();

  Future<void> updateCandidato({required String campo, required String valor});

  // Future<String> getFotoPerfil();
  Future<String> getCampo({required String campo});

  // Future<void> setFotoPerfil({required String foto});

  // Future<String> getUrlImagem();
}
