import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sistema_inscricao/app/servicos/dados_pessoais_api.dart';
import 'package:sistema_inscricao/app/servicos/estado_global.dart';
import 'package:sistema_inscricao/app/views/components/mensagem_erro.dart';
import 'package:sistema_inscricao/app/views/components/menu_inscricao.dart';
// import 'package:sistema_inscricao/app/views/pages/registar/registar_pagamento.dart';
import 'package:file_picker/file_picker.dart';

class RegistarPagamento extends StatefulWidget {
  const RegistarPagamento({super.key});

  @override
  State<RegistarPagamento> createState() => _RegistarPagamentoState();
}

class _RegistarPagamentoState extends State<RegistarPagamento> {
  @override
  build(BuildContext context) {
    var emailController = TextEditingController();

    // var keyFormPesquisar = GlobalKey<FormState>();
    var keyFormDadosAutenticar = GlobalKey<FormState>();
    var caminhoFile = 'Formato permitido - PDF';

    void selecionarArquivo() async {
      FilePickerResult? resultado = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (resultado != null) {
        setState(() {
          caminhoFile = resultado.files.single.path ?? 'Ola';
          // ignore: avoid_print
          print("Peguei: $caminhoFile");
        });
      }
    }

    return AnimatedBuilder(
        animation: EstadoGlobal.estadoGlobal,
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
                          selecionado: false,
                          texto: 'Formação',
                          icon: Icons.school),
                      MenuItem(
                          selecionado: true,
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
                        // color: Colors.white,
                        child: Form(
                          key: keyFormDadosAutenticar,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 400.0,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: const Color.fromRGBO(138, 67, 9, 1),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Valor a Pagar -> 6000kz',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: selecionarArquivo,
                                // onPressed: () {},
                                child: const Text(
                                    'Carregar comprovativo do pagamento'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: emailController,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Campo de email não pode estar vazio.";
                                    } else if (!value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Coloque no formato de email. ex.:claudio@gmail.com';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.file_copy,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: caminhoFile,
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
                              ListTile(
                                trailing: ElevatedButton.icon(
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         const RegistarPagamento(),
                                    //   ),
                                    // );
                                    // ignore: avoid_print
                                    print('Inscrição realizada com sucesso');
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Finalizar Inscrição',
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
