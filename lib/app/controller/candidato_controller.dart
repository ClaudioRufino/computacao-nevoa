import 'package:sistema_inscricao/app/models/candidato_model.dart';

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

  getNomePai() {
    Candidato.instancia.getNomePai();
  }

  setNomeMae(String nomeMae) {
    Candidato.instancia.setNomeMae(nomeMae);
  }

  getEmitido() {
    Candidato.instancia.getEmitido();
  }

  setEmitido(String emitido) {
    Candidato.instancia.setEmitido(emitido);
  }

  setEmail(String email) {
    Candidato.instancia.setEmail(email);
  }

  getEmail() {
    Candidato.instancia.getEmail();
  }

  setSenha(String senha) {
    Candidato.instancia.setSenha(senha);
  }

  getSenha() {
    Candidato.instancia.getSenha();
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

  setCertificado(String valor) {
    Candidato.instancia.setCertificado(valor);
  }

  String getCertificado() {
    return Candidato.instancia.getCertificado();
  }

  void eliminarCurso() {
    Candidato.instancia.eliminarCursos();
  }

  int totalCurso() {
    return Candidato.instancia.totalCurso();
  }

  void reiniciar() {
    Candidato.instancia.reiniciar();
  }
}
