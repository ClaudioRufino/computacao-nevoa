import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  cadastrarUsuario({required String email, required String senha}) {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
  }

  logarUsuario({required String email, required String senha}) {
    try {
      _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao fazer o login: ');
    }
  }

  sair() {
    _firebaseAuth.signOut();
  }
}
