import 'package:sistema_inscricao/app/models/usuario.dart';

class Candidato extends Usuario {
  

  Candidato._(
      {required super.nome,
      required super.email,
      required super.senha,
  });

  static final Candidato instancia = Candidato._(
      nome: 'nome',
      email: 'email',
      senha: 'senha',
  );

  

  
  

  

  void reiniciar() {
    nome = 'nome';
    email = 'email';
    senha = 'senha';
  }

  // Método para converter a instância para um mapa
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }
}
