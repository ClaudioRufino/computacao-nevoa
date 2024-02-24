import 'package:sistema_inscricao/app/models/usuario.dart';

class Candidato extends User {
  late String dataNascimento;
  late String genero;
  late String nomePai;
  late String nomeMae;
  late String escola;
  late int media;
  late String certificado;
  late String emitidoEm;
  late double anoConclusaoMedio;
  late List<String> curso;
  // late String curso2;

  Candidato._({
    required super.nome,
    required super.email,
    required super.senha,
    required this.genero,
    required this.escola,
    required this.media,
    required this.emitidoEm,
    required this.nomePai,
    required this.nomeMae,
    required this.certificado,
    required this.dataNascimento,
    required this.curso,
    // required this.curso2,
  });

  static final Candidato instancia = Candidato._(
    nome: 'nome',
    email: 'email',
    senha: 'senha',
    genero: 'genero',
    escola: 'escola',
    media: 0,
    nomePai: 'nomePai',
    nomeMae: 'nomeMae',
    certificado: '',
    emitidoEm: 'emitido',
    curso: [],
    // curso2: '',
    dataNascimento: 'dataNascimento',
  );

  String getNome() {
    return nome;
  }

  getEmail() {
    return email;
  }

  String getSenha() {
    return senha;
  }

  String getEscola() {
    return escola;
  }

  int getMedia() {
    return media;
  }

  String getNomePai() {
    return nomePai;
  }

  String getNomeMae() {
    return nomeMae;
  }

  String getEmitido() {
    return emitidoEm;
  }

  String getCertificado() {
    return certificado;
  }

  String getDataNascimento() {
    return dataNascimento;
  }

  setNome(String nome) {
    super.nome = nome;
  }

  setEmail(String email) {
    this.email = email;
  }

  setSenha(String senha) {
    this.senha = senha;
  }

  setEscola(String escola) {
    this.escola = escola;
  }

  setMedia(int valor) {
    media = valor;
  }

  setNomePai(String nome) {
    nomePai = nome;
  }

  setNomeMae(String nome) {
    nomeMae = nome;
  }

  setDataNascimento(String data) {
    dataNascimento = data;
  }

  void setEmitido(String emitido) {
    emitidoEm = emitido;
  }

  void setCertificado(String valor) {
    certificado = valor;
  }

  List<String> getCurso() {
    return curso;
  }

  void setCurso(String valor) {
    curso.add(valor);
  }

  // String getCurso2() {
  //   return curso1;
  // }

  // void setCurso2(String valor) {
  //   curso1 = valor;
  // }

  void eliminarCursos() {
    curso = [];
  }

  int totalCurso() {
    if (curso.length == 2) {
      return 2;
    }
    return 1;
  }

  void reiniciar() {
    nome = 'nome';
    email = 'email';
    senha = 'senha';
    genero = 'genero';
    escola = 'escola';
    media = 0;
    nomePai = 'nomePai';
    nomeMae = 'nomeMae';
    certificado = '';
    emitidoEm = 'emitido';
    curso = [];
    // curso2 = '';
    dataNascimento = 'dataNascimento';
  }
}
