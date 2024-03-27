import 'package:flutter/material.dart';

class FormacaoController {
  ValueNotifier<bool> opcao = ValueNotifier<bool>(false);
  bool umaOpcao = true;
  bool duasOpcoes = false;
  late String _curso;
  final List<String> _listaCursos = [
    'Selecione o curso',
    'Informática',
    'Informática de Gestão',
    'Telecomunicação'
  ];

  final List<String> _listaEscolas = [
    'Selecione a escola',
    'Itel',
    'Aldalara',
    'IMIL',
    'IMEL',
    'Mpangui Afonso',
    'Politécnico do Cazenga',
    'Politécnico do Sambizanga',
    'Politécnico de Cacuaco'
  ];

  String getCurso() {
    return _curso;
  }

  void setCurso(String curso) {
    _curso = curso;
  }

  void setUmaOpcao() {
    umaOpcao = !umaOpcao;
  }

  void setDuasOpcoes() {
    duasOpcoes = !duasOpcoes;
  }

  void setOpcao() {
    opcao.value = !opcao.value;
  }

  List<String> listaCurso(String? curso) {
    if (duasOpcoes == false) {
      return _listaCursos;
    } else {
      if (curso == 'Selecione Segundo Curso') {
        return [
          'Selecione o curso',
          'Informática',
          'Informática de Gestão',
          'Telecomunicação'
        ];
      } else if (curso == 'Informática') {
        return [
          'Selecione o curso',
          'Informática de Gestão',
          'Telecomunicação'
        ];
      } else if (curso == 'Informática de Gestão') {
        return ['Selecione o curso', 'Informática', 'Telecomunicação'];
      } else {
        return ['Selecione o curso', 'Informática', 'Informática de Gestão'];
      }
    }
  }

  List<String> listaescola() {
    return _listaEscolas;
  }

  List<String> listaOpcoes(String cursoEscolhido) {
    late List<String> novaLista;

    // ignore: avoid_print
    // print(cursoEscolhido);

    if (cursoEscolhido == 'Selecione o curso') {
      if (duasOpcoes == true) {
        // setUmaOpcao();
        // setDuasOpcoes();
        return [];
      } else {
        novaLista = [
          'Selecione Segundo Curso',
          'Selecione Primeiro o Curso Principal'
        ];
        return novaLista;
      }
    } else if (cursoEscolhido == 'Informática') {
      novaLista = [
        'Selecione Segundo Curso',
        'Informática de Gestão',
        'Telecomunicação'
      ];
      return novaLista;
    } else if (cursoEscolhido == 'Telecomunicação') {
      novaLista = [
        'Selecione Segundo Curso',
        'Informática',
        'Informática de Gestão'
      ];
      return novaLista;
    } else {
      novaLista = ['Selecione Segundo Curso', 'Informática', 'Telecomunicação'];
      return novaLista;
    }
  }
}
