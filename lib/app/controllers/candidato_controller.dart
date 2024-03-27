// ignore_for_file: unused_local_variable, avoid_print

import 'package:sistema_inscricao/app/models/candidato.dart';
import 'package:sistema_inscricao/app/repositories/db_repository.dart';

class CandidatoController {
  CandidatoController();

  // Instância para trabalhar com o banco de dados
  DbRepository banco = DbRepository();

  String getFotoPerfil() {
    banco.getFotoPerfil().then((path) => setFoto(path));
    var url = getFoto();
    return url;
  }

  String getCampo({required String campo}) {
    banco.getFotoPerfil().then((value) => setFoto(value));
    var url = getFoto();
    return url;
  }

  setFotoPerfil(String foto) {
    banco.updateCandidato(campo: 'imagem', valor: foto);
  }

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

  setCurso1(String valor) {
    Candidato.instancia.setCurso1(valor);
  }

  String getCurso1() {
    return Candidato.instancia.getCurso1();
  }

  setCertificado(String valor) {
    Candidato.instancia.setCertificado(valor);
  }

  String getCertificado() {
    return Candidato.instancia.getCertificado();
  }

  // String getFotoPerfil() {
  //   return Candidato.instancia.getFotoPerfil();
  // }

  // void eliminarCurso() {
  //   Candidato.instancia.eliminarCursos();
  // }

  int totalCurso() {
    return Candidato.instancia.totalCurso();
  }

  void reiniciar() {
    Candidato.instancia.reiniciar();
  }

  setFoto(String foto) {
    Candidato.instancia.setFoto(foto);
  }

  String getFoto() {
    return Candidato.instancia.getFoto();
  }
}
