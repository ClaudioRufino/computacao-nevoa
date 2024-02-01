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

  getEscola() {
    Candidato.instancia.getEscola();
  }

  setMedia(double valor) {
    Candidato.instancia.setMedia(valor);
  }

  getMedia() {
    Candidato.instancia.getMedia();
  }

  String listar() {
    return Candidato.instancia.getNome();
  }
}
