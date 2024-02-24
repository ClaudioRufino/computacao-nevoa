import 'package:sistema_inscricao/app/models/candidato.dart';

class CandidatoController {
  CandidatoController();

  adicionarCandidato() {}

  removerCandidato() {}

  setNome(String nome) {
    Candidato.instancia.setNome(nome);
  }

  String getNome() {
    return Candidato.instancia.getNome();
  }

  setDataNascimento(String dataNascimento) {
    Candidato.instancia.setDataNascimento(dataNascimento);
  }

  getDataNascimento() {
    Candidato.instancia.getDataNascimento();
  }

  setNomePai(String nomePai) {
    Candidato.instancia.setNomePai(nomePai);
  }

  String getNomePai() {
    return Candidato.instancia.getNomePai();
  }

  setNomeMae(String nomeMae) {
    Candidato.instancia.setNomeMae(nomeMae);
  }

  String getNomeMae() {
    return Candidato.instancia.getNomeMae();
  }

  String getEmitido() {
    return Candidato.instancia.getEmitido();
  }

  setEmitido(String emitido) {
    Candidato.instancia.setEmitido(emitido);
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

  setEscola(String escola) {
    Candidato.instancia.setEscola(escola);
  }

  String getEscola() {
    return Candidato.instancia.getEscola();
  }

  setMedia(int valor) {
    Candidato.instancia.setMedia(valor);
  }

  int getMedia() {
    return Candidato.instancia.getMedia();
  }

  String listar() {
    return Candidato.instancia.getNome();
  }

  setCurso(String valor) {
    Candidato.instancia.setCurso(valor);
  }

  List<String> getCurso() {
    return Candidato.instancia.getCurso();
  }

  // setCurso2(String valor) {
  //   Candidato.instancia.setCurso2(valor);
  // }

  // String getCurso2() {
  //   return Candidato.instancia.getCurso2();
  // }

  setCertificado(String valor) {
    Candidato.instancia.setCertificado(valor);
  }

  String getCertificado() {
    return Candidato.instancia.getCertificado();
  }

  // void eliminarCurso() {
  //   Candidato.instancia.eliminarCursos();
  // }

  int totalCurso() {
    return Candidato.instancia.totalCurso();
  }

  void reiniciar() {
    Candidato.instancia.reiniciar();
  }
}
