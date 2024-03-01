import 'package:firebase_auth/firebase_auth.dart';
import 'package:sistema_inscricao/app/controller/candidato_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sistema_inscricao/app/views/pages/principal/tela_principal.dart';

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
        'escola': cand.getEscola(),
        'media': cand.getMedia(),
        'nomePai': 'Rufino', //cand.getNomePai(),
        'nomeMae': 'Mosalina', // cand.getNomeMae(),
        'certificado': cand.getCertificado(),
        'emitidoEm': '10-12-32', //cand.getEmitido(),
        'curso': ['ingles', 'dadiva'],
        'dataNascimento': '1998-05-15',
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
