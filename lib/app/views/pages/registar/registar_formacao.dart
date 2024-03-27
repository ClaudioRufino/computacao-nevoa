// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/controllers/candidato_controller.dart';
import 'package:sistema_inscricao/app/controllers/registar/formacao_controller.dart';
import 'package:sistema_inscricao/app/repositories/autenticacao_servico/autenticacao_servico.dart';
// import 'package:sistema_inscricao/app/servicos/dados_pessoais_api.dart';
import 'package:sistema_inscricao/app/repositories/estado_global.dart';
import 'package:sistema_inscricao/app/views/components/mensagem.dart';
import 'package:sistema_inscricao/app/views/components/menu_inscricao.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';
import 'package:sistema_inscricao/app/views/pages/registar/registar_pagamento.dart';
import 'package:file_picker/file_picker.dart';

class RegistarFormacao extends StatefulWidget {
  const RegistarFormacao({super.key});

  @override
  State<RegistarFormacao> createState() => _RegistarFormacaoState();
}

class _RegistarFormacaoState extends State<RegistarFormacao> {
  String selectEscola = 'Selecione a escola';
  String selectOpcaoCurso = 'Uma opção';
  String selectMedia = 'Selecione a média';
  String selectCurso = 'Selecione o curso';
  String selectSegundaOpcao = 'Selecione Segundo Curso';

  final AutenticacaoServico _authServico = AutenticacaoServico();

  List<String> listaMedias = [
    'Selecione a média',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];

  List<String> listaOpcaoCursos = ['Uma opção', 'Duas opções'];

  /* Instanciar a classe FormacaoController */
  var formacaoController = FormacaoController();
  var candidatoController = CandidatoController();

  var caminhoFile = 'FORMATO PERMITIDO - PDF';
  void selecionarArquivo() async {
    FilePickerResult? resultado = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (resultado != null) {
      setState(() {
        caminhoFile = resultado.files.single.path ?? '';
        candidatoController.setCertificado(caminhoFile);
        caminhoFile = caminhoFile.substring(60);
        arquivo = caminhoFile;
      });
    } else {
      // ignore: avoid_print
      print('Caminho Nulo');
    }
  }

  String curso1 = '';
  String curso2 = '';

  String arquivo = "";

  bool erroEscola = false;
  bool erroMedia = false;
  bool erroCurso = false;
  bool erroCertificado = false;

  @override
  Widget build(BuildContext context) {
    // var keyFormPesquisar = GlobalKey<FormState>();
    var keyFormDadosFormacao = GlobalKey<FormState>();
    var candidatoController = CandidatoController();

    return AnimatedBuilder(
        animation: formacaoController.opcao,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 24, 56, 97),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 24, 56, 97),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 40,
                  color: Colors.white,
                  child: Image.asset(
                    'images/logo.png',
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    _authServico.sair();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
              ],
              title: Text(
                'Inscrição-2024',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  const Menu(
                    menuItem: [
                      MenuItem(
                          selecionado: false,
                          texto: 'Pessoal',
                          icon: Icons.person_2_sharp),
                      MenuItem(
                          selecionado: true,
                          texto: 'Formação',
                          icon: Icons.school),
                      MenuItem(
                          selecionado: false,
                          texto: 'Pagamento',
                          icon: Icons.payment),
                    ],
                  ),
                  Column(
                    children: [
                      if (EstadoGlobal.estadoGlobal.getMensagemErro())
                        StreamBuilder<int>(
                          stream: tempo(),
                          builder: (context, AsyncSnapshot<int> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                // ignore: avoid_print
                                print('Encontrado valor nulo');
                                return Container();
                              case ConnectionState.waiting:
                                // ignore: avoid_print
                                print('Esperando');
                                return const Mensagem(
                                    cor: Color.fromARGB(255, 173, 17, 17),
                                    texto:
                                        'Candidato não encontrado. Pesquise com o seu B.I');
                              case ConnectionState.active:
                                // ignore: avoid_print
                                return const Mensagem(
                                    cor: Color.fromARGB(255, 173, 17, 17),
                                    texto:
                                        'Candidato não encontrado. Pesquise com o seu B.I');
                              case ConnectionState.done:
                                // ignore: avoid_print
                                print('Terminado');
                            }
                            return Container();
                          },
                        ),
                      Container(
                        height: 30,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        child: Form(
                          key: keyFormDadosFormacao,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  value: selectEscola,
                                  // borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 24, 56, 97),
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 24, 56, 97),
                                  ),
                                  items: formacaoController
                                      .listaescola()
                                      .map(
                                        (escola) => DropdownMenuItem<String>(
                                          value: escola,
                                          child: Text(
                                            escola,
                                            style: GoogleFonts.quicksand(
                                                color: const Color.fromARGB(
                                                    255, 24, 56, 97),
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectEscola = value!;
                                      erroEscola = false;
                                    });
                                  },
                                ),
                              ),
                              Visibility(
                                visible: erroEscola,
                                child: const Text(
                                  'Por favor, selecione uma escola.',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<String>(
                                  value: selectMedia,
                                  // borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 24, 56, 97),
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 24, 56, 97),
                                  ),
                                  items: listaMedias
                                      .map(
                                        (media) => DropdownMenuItem<String>(
                                          value: media,
                                          child: Text(
                                            media,
                                            style: GoogleFonts.quicksand(
                                                color: const Color.fromARGB(
                                                    255, 24, 56, 97),
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectMedia = value!;
                                      erroMedia = false;
                                    });
                                  },
                                ),
                              ),
                              Visibility(
                                visible: erroMedia,
                                child: const Text(
                                  'Por favor, selecione a média.',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Carregar Certificado',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 24, 56, 97),
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        child: const Icon(
                                          Icons.file_upload,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 24, 56, 97),
                                        ),
                                        onTap: () {
                                          // ignore: avoid_print
                                          print(
                                              'Clicou em carregar certificado.');
                                          selecionarArquivo();
                                          erroCertificado = false;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: erroCertificado,
                                child: const Text(
                                  'Por favor, carrega o certificado.',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.file_copy,
                                      size: 16,
                                      color: Colors.redAccent,
                                    ),
                                    hintText: caminhoFile,
                                    hintStyle: GoogleFonts.quicksand(
                                      color: Colors.redAccent,
                                      // fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 24, 56, 97),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 24, 56, 97),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Divider(),
                              const ListTile(
                                title: Text(
                                  'INFORMAÇÕES DO CURSO',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 24, 56, 97),
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  'Escolha um curso Principal e uma segunda opção, se desejar.',
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  value: selectCurso,
                                  borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 24, 56, 97),
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 24, 56, 97),
                                  ),
                                  items: formacaoController
                                      .listaCurso(selectSegundaOpcao)
                                      .map(
                                        (curso) => DropdownMenuItem<String>(
                                          value: curso,
                                          child: Text(
                                            curso,
                                            style: GoogleFonts.quicksand(
                                                color: const Color.fromARGB(
                                                    255, 24, 56, 97),
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    // ignore: avoid_print
                                    // print('Curso selecionado: $value');
                                    if (value != 'Selecione o curso') {
                                      curso1 = value!;
                                      erroCurso = false;
                                    }
                                    // ignore: avoid_print

                                    setState(() {
                                      selectCurso = value!;
                                    });
                                  },
                                ),
                              ),
                              Visibility(
                                visible: erroCurso,
                                child: const Text(
                                  'Por favor, selecioneo curso pretendido.',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  value: selectOpcaoCurso,
                                  borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 24, 56, 97),
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 24, 56, 97),
                                  ),
                                  items: listaOpcaoCursos
                                      .map(
                                        (curso) => DropdownMenuItem<String>(
                                          value: curso,
                                          child: Text(
                                            curso,
                                            style: GoogleFonts.quicksand(
                                                color: const Color.fromARGB(
                                                    255, 24, 56, 97),
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectOpcaoCurso = value!;
                                      // ignore: avoid_print
                                      if (selectOpcaoCurso == 'Uma opção' &&
                                          formacaoController.umaOpcao ==
                                              false) {
                                        formacaoController.setUmaOpcao();
                                        formacaoController.setDuasOpcoes();
                                        formacaoController.setOpcao();
                                        curso2 = '';
                                      } else if (selectOpcaoCurso ==
                                              'Duas opções' &&
                                          formacaoController.duasOpcoes ==
                                              false) {
                                        formacaoController.setDuasOpcoes();
                                        formacaoController.setUmaOpcao();

                                        formacaoController.setOpcao();
                                      }
                                    });
                                  },
                                ),
                              ),
                              Visibility(
                                visible: formacaoController.opcao.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    value: selectSegundaOpcao,
                                    borderRadius: BorderRadius.circular(40),
                                    iconEnabledColor:
                                        const Color.fromARGB(255, 24, 56, 97),
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      color:
                                          const Color.fromARGB(255, 24, 56, 97),
                                    ),
                                    items: formacaoController
                                        .listaOpcoes(selectCurso)
                                        .map(
                                          (curso) => DropdownMenuItem<String>(
                                            value: curso,
                                            child: Text(
                                              curso,
                                              style: GoogleFonts.quicksand(
                                                  color: const Color.fromARGB(
                                                      255, 24, 56, 97),
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != 'Selecione Segundo Curso') {
                                        curso2 = value!;
                                      }
                                      setState(() {
                                        selectSegundaOpcao = value!;
                                        // ignore: avoid_print
                                        // print('Cursos Alternativos');
                                      });
                                    },
                                  ),
                                ),
                              ),
                              ListTile(
                                trailing: ElevatedButton.icon(
                                  onPressed: () {
                                    if (selectEscola == "Selecione a escola") {
                                      setState(() {
                                        erroEscola = true;
                                      });
                                    } else if (selectMedia ==
                                        "Selecione a média") {
                                      setState(() {
                                        erroMedia = true;
                                      });
                                    } else if (arquivo.isEmpty) {
                                      setState(() {
                                        erroCertificado = true;
                                      });
                                    } else if (selectCurso ==
                                        "Selecione o curso") {
                                      setState(() {
                                        erroCurso = true;
                                      });
                                    } else {
                                      candidatoController
                                          .setEscola(selectEscola);
                                      candidatoController
                                          .setMedia(int.parse(selectMedia));

                                      // Esse parte já foi feito no método de seleção do arquivo.
                                      // candidatoController
                                      //     .setCertificado(arquivo);

                                      // ignore: avoid_print
                                      if (curso1 != '' &&
                                          curso1 != 'Selecione o curso') {
                                        candidatoController.setCurso1(curso1);
                                      }
                                      if (curso2 != '' &&
                                          curso2 != 'Selecione Segundo Curso') {
                                        candidatoController.setCurso1(curso2);
                                      }

                                      // ignore: avoid_print
                                      // print(candidatoController.totalCurso());
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistarPagamento(),
                                        ),
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'PRÓXIMO',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 24, 56, 97),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Stream<int> tempo() async* {
  int i;
  for (i = 0; i < 2; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

// BorderRadius _bordasRedonda() {
//   return const BorderRadius.only(
//       topLeft: Radius.circular(20),
//       topRight: Radius.circular(20),
//       bottomLeft: Radius.circular(20),
//       bottomRight: Radius.circular(20));
// }
