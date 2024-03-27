import 'package:sistema_inscricao/app/models/usuario.dart';

class Candidato extends Usuario {
  late String _dataNascimento;
  late String _genero;
  late String _nomePai;
  late String _nomeMae;
  late String _escola;
  late int _media;
  late String _certificado;
  late String _fotoPerfil;
  late String _emitidoEm;
  late int _anoConclusaoMedio;
  late String _curso1;
  late String _curso2;

  Candidato._(
      {required super.nome,
      required super.email,
      required super.senha,
      required String curso1,
      required String curso2,
      required int media,
      required String genero,
      required String escola,
      required String emitidoEm,
      required String nomePai,
      required String nomeMae,
      required String fotoPerfil,
      required String certificado,
      required String dataNascimento,
      required int anoConclusaoMedio})
      : _nomePai = nomePai,
        _nomeMae = nomeMae,
        _curso1 = curso1,
        _curso2 = curso2,
        _media = media,
        _certificado = certificado,
        _dataNascimento = dataNascimento,
        _fotoPerfil = fotoPerfil,
        _genero = genero,
        _escola = escola,
        _emitidoEm = emitidoEm,
        _anoConclusaoMedio = anoConclusaoMedio;

  static final Candidato instancia = Candidato._(
      nome: 'nome',
      email: 'email',
      senha: 'senha',
      genero: 'genero',
      escola: 'escola',
      nomePai: 'nomePai',
      nomeMae: 'nomeMae',
      emitidoEm: 'emitido',
      fotoPerfil: '',
      certificado: '',
      curso1: '',
      curso2: '',
      media: 0,
      dataNascimento: 'dataNascimento',
      anoConclusaoMedio: 0);

  String getEscola() {
    return _escola;
  }

  int getMedia() {
    return _media;
  }

  String getNomePai() {
    return _nomePai;
  }

  String getNomeMae() {
    return _nomeMae;
  }

  String getEmitido() {
    return _emitidoEm;
  }

  String getCertificado() {
    return _certificado;
  }

  String getDataNascimento() {
    return _dataNascimento;
  }

  String getAnoConclusaoMedio() {
    return _anoConclusaoMedio.toString();
  }

  String getFoto() {
    return _fotoPerfil;
  }

  setEscola(String escola) {
    _escola = escola;
  }

  setMedia(int valor) {
    _media = valor;
  }

  setNomePai(String nome) {
    _nomePai = nome;
  }

  setNomeMae(String nome) {
    _nomeMae = nome;
  }

  setDataNascimento(String data) {
    _dataNascimento = data;
  }

  void setEmitido(String emitido) {
    _emitidoEm = emitido;
  }

  void setCertificado(String valor) {
    _certificado = valor;
  }

  setFoto(String foto) {
    _fotoPerfil = foto;
  }

  setCurso1(String valor) {
    _curso1 = valor;
  }

  setCurso2(String valor) {
    _curso2 = valor;
  }

  void setAnoConclusaoMedio(int valor) {
    _anoConclusaoMedio = valor;
  }

  String getCurso1() {
    return _curso1;
  }

  String getCurso2() {
    return _curso2;
  }

  int totalCurso() {
    if (!_curso1.isNotEmpty && _curso2.isNotEmpty) {
      return 2;
    }
    return 1;
  }

  void reiniciar() {
    nome = 'nome';
    email = 'email';
    senha = 'senha';
    _genero = 'genero';
    _escola = 'escola';
    _media = 0;
    _nomePai = 'nomePai';
    _nomeMae = 'nomeMae';
    _certificado = '';
    _emitidoEm = 'emitido';
    _curso1 = '';
    _curso2 = '';
    _dataNascimento = 'dataNascimento';
  }

  // Método para converter a instância para um mapa
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'genero': _genero,
      'escola': _escola,
      'media': _media,
      'nomePai': _nomePai,
      'nomeMae': _nomeMae,
      'certificado': _certificado,
      'emitidoEm': _emitidoEm,
      'curso1': _curso1,
      'curso2': _curso2,
      'dataNascimento': _dataNascimento,
    };
  }
}
