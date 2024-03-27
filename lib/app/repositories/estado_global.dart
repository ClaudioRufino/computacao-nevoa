import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EstadoGlobal extends ChangeNotifier {
  bool valor = true;
  bool cadastrado = false;
  List<String> usuarios = [];
  bool msgErro = false;

  void mudarValor(bool? value) {
    valor = value!;
    // ignore: avoid_print
    print('Valor mudado com sucesso!');
    notifyListeners();
  }

  bool getCadastrado() {
    return cadastrado;
  }

  bool getMensagemErro() {
    return msgErro;
  }

  setMensagemErro(bool value) {
    msgErro = value;
    notifyListeners();
  }

  void setCadastrado(bool value) {
    cadastrado = value;
    notifyListeners();
  }

  addUsuario(String nome) {
    usuarios.add(nome);
    cadastrado = true;
    notifyListeners();
  }

  List<Widget> minhaLista() {
    List<Widget> lista = [];
    for (var nome in usuarios) {
      lista.add(Text(
        nome,
        style: GoogleFonts.ubuntu(fontSize: 16),
      ));
      lista.add(const Divider(height: 10));
    }
    return lista;
  }

  /* Instancia única do estado global que vai actuar como meu singleton */
  static var estadoGlobal = EstadoGlobal();
}
