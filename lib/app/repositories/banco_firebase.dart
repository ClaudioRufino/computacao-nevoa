// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sistema_inscricao/app/interfaces/bd.dart';
import 'package:sistema_inscricao/app/models/candidato.dart';

class BancoFirebase extends BD {
  // O nosso banco de dados será representado pelo Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // criar um usuário auntenticado antes de criar outros dados do candidato
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<UserCredential> autenticaticacao(
      {required String email, required String senha}) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      return userCredential;
    } catch (e) {
      throw Exception("Ocorreu um erro durante a operação assíncrona");
    }
  }

  @override
  Future<void> addCandidato(Candidato candidato) async {
    try {
      final userCredential = await autenticaticacao(
          email: candidato.getEmail(), senha: candidato.getSenha());

      String id = userCredential.user!.uid;
      await firestore.collection('candidatos').doc(id).set(candidato.toMap());
      print('Objeto adicionado com sucesso ao Firestore!');
    } catch (error) {
      print('Erro ao adicionar objeto ao Firestore: $error');
    }
  }

  @override
  Future<void> deleteCandidato({required String id}) async {
    try {
      await firestore.doc(id).delete();
      print('Eliminado com sucesso!');
    } catch (e) {
      throw Exception('Erro ao eliminar candidato');
    }
  }

  User? getUserAtivo() {
    return auth.currentUser;
  }

  Future<bool> addNome(String valor) async {
    var usuarioAtivo = getUserAtivo();

    if (usuarioAtivo != null) {
      var idUsuarioAtivo = usuarioAtivo.uid;
      await firestore
          .collection('nome')
          .doc(idUsuarioAtivo)
          .set({'valor': valor});
      return true;
    }
    return false;
  }

  @override
  Future<void> updateCandidato(
      {required String campo, required String valor}) async {
    User? usuario = auth.currentUser;
    String idUsuario = usuario!.uid;

    await firestore.collection('usuarios').doc(idUsuario).update({
      campo: valor,
    });
    print('Atualizado com sucesso');
  }

  Future<String> getFotoPerfil() async {
    User? usuario = auth.currentUser;
    String idUsuario = usuario!.uid;
    final candidato = firestore.collection('usuarios').doc(idUsuario);
    DocumentSnapshot candidatoSnapshot = await candidato.get();
    if (candidatoSnapshot.exists && candidatoSnapshot['imagem'] != '') {
      return candidatoSnapshot['imagem'].toString();
    }
    return '';
  }

  @override
  Future<String> getCampo({required String campo}) async {
    User? usuario = auth.currentUser;
    String idUsuario = usuario!.uid;
    final candidato = firestore.collection('usuarios').doc(idUsuario);
    DocumentSnapshot candidatoSnapshot = await candidato.get();
    if (candidatoSnapshot.exists && candidatoSnapshot[campo] != '') {
      return candidatoSnapshot[campo].toString();
    }
    return '';
  }
}
