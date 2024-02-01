import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/controller/candidato_controller.dart';
import 'package:sistema_inscricao/app/controller/registar/formacao_controller.dart';
// import 'package:sistema_inscricao/app/servicos/dados_pessoais_api.dart';
import 'package:sistema_inscricao/app/servicos/estado_global.dart';
import 'package:sistema_inscricao/app/views/components/mensagem_erro.dart';
import 'package:sistema_inscricao/app/views/components/menu_inscricao.dart';
import 'package:sistema_inscricao/app/views/pages/registar/registar_pagamento.dart';

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

  @override
  Widget build(BuildContext context) {
    var dataNascimentoController = TextEditingController();

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
              actions: const [
                Icon(
                  Icons.login,
                  color: Colors.white,
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
                                return const MensagemErro(
                                    texto:
                                        'Candidato não encontrado. Pesquise com o seu B.I');
                              case ConnectionState.active:
                                // ignore: avoid_print
                                return const MensagemErro(
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
                      const SizedBox(height: 5),
                      Container(
                        height: 10,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                      ),
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
                                  borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor: Colors.blue,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color: Colors.blue,
                                  ),
                                  items: formacaoController
                                      .listaescola()
                                      .map(
                                        (escola) => DropdownMenuItem<String>(
                                          value: escola,
                                          child: Text(
                                            escola,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectEscola = value!;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<String>(
                                  value: selectMedia,
                                  borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor: Colors.blue,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color: Colors.blue,
                                  ),
                                  items: listaMedias
                                      .map(
                                        (media) => DropdownMenuItem<String>(
                                          value: media,
                                          child: Text(
                                            media,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectMedia = value!;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: dataNascimentoController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Data de Nascimento',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    hintStyle: GoogleFonts.quicksand(
                                        color: Colors.blue,
                                        fontStyle: FontStyle.italic),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    errorBorder: _erroBorda(),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: _bordasRedonda(),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const DividerTheme(
                                data: DividerThemeData(),
                                child: Text(
                                  'Informações do curso',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  value: selectCurso,
                                  borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor: Colors.blue,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color: Colors.blue,
                                  ),
                                  items: formacaoController
                                      .listaCurso(selectSegundaOpcao)
                                      .map(
                                        (curso) => DropdownMenuItem<String>(
                                          value: curso,
                                          child: Text(
                                            curso,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectCurso = value!;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  value: selectOpcaoCurso,
                                  borderRadius: BorderRadius.circular(40),
                                  iconEnabledColor: Colors.blue,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 1,
                                    color: Colors.blue,
                                  ),
                                  items: listaOpcaoCursos
                                      .map(
                                        (curso) => DropdownMenuItem<String>(
                                          value: curso,
                                          child: Text(
                                            curso,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.blue,
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
                                    iconEnabledColor: Colors.blue,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.blue,
                                    ),
                                    items: formacaoController
                                        .listaOpcoes(selectCurso)
                                        .map(
                                          (curso) => DropdownMenuItem<String>(
                                            value: curso,
                                            child: Text(
                                              curso,
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.blue,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
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
                                    candidatoController.setEscola(selectEscola);
                                    // candidatoController
                                    //     .setMedia(double.parse(selectMedia));

                                    // ignore: avoid_print
                                    print(selectMedia);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistarPagamento(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Proximo',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(138, 67, 9, 1),
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

InputBorder _erroBorda() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
    ),
    borderRadius: _bordasRedonda(),
  );
}

BorderRadius _bordasRedonda() {
  return const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20));
}

Stream<int> tempo() async* {
  int i;
  for (i = 0; i < 2; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
