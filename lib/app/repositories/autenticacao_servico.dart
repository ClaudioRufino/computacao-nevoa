import 'package:firebase_auth/firebase_auth.dart';
import 'package:sistema_inscricao/app/controllers/candidato_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutenticacaoServico {
  // Crie uma instancia para o Firebase.auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Crie uma referência para o Firestore
  final firestore = FirebaseFirestore.instance;

  Future<void> cadastrarUsuario({required CandidatoController cand}) async {
    try {
      // Crie um novo usuário no Firebase Authentication
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: cand.getEmail(), password: cand.getSenha());

      final idUser = userCredential.user!.uid;

      await firestore.collection('usuarios').doc(idUser).set({
        'nome': 'audilia', //cand.getNome(),
      });

      // ignore: avoid_print
      print('Usuário adicionado com sucesso!');
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao cadastrar o usuário');
    }
  }

  Future<bool> logarUsuario(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);

      return true;
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao fazer o login: $e');
      return false;
    }
  }

  sair() {
    _firebaseAuth.signOut();
  }
}
