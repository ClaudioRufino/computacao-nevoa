// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/controller/candidato_controller.dart';
import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';
import 'package:sistema_inscricao/app/views/components/mensagem.dart';
import 'package:sistema_inscricao/app/views/components/menu_inscricao.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';

class RegistarPagamento extends StatefulWidget {
  const RegistarPagamento({super.key});

  @override
  State<RegistarPagamento> createState() => _RegistarPagamentoState();
}

class _RegistarPagamentoState extends State<RegistarPagamento> {
  var candidatoController = CandidatoController();
  var caminhoFile = 'Formato permitido - PDF';
  int valorInscricao = 0;
  ValueNotifier<bool> sucesso = ValueNotifier<bool>(false);

  final AutenticacaoServico _authServico = AutenticacaoServico();

  void selecionarArquivo() async {
    // ignore: avoid_print
    print('Clicou em mim');
    FilePickerResult? resultado = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (resultado != null) {
      setState(() {
        caminhoFile = resultado.files.single.path ?? '';
        caminhoFile = caminhoFile.substring(60);
      });
    } else {
      // ignore: avoid_print
      print('Caminho Nulo');
    }
  }

  @override
  build(BuildContext context) {
    var emailController = TextEditingController();

    // valorInscricao = candidatoController.totalCurso();
    int valorInscricao = candidatoController.totalCurso() == 2 ? 8000 : 4000;

    // var keyFormPesquisar = GlobalKey<FormState>();
    var keyFormDadosAutenticar = GlobalKey<FormState>();

    return AnimatedBuilder(
      animation: sucesso,
      builder: (context, child) => PopScope(
        onPopInvoked: (value) {
          // ignore: avoid_print
          print('Clicou em Voltar');
          // candidatoController.eliminarCurso();
        },
        child: Scaffold(
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
                  // ignore: avoid_print
                  print('Saiu com sucesso!');
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
                    // if (sucesso.value)

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
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color.fromARGB(255, 33, 73, 126),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total a pagar -> $valorInscricao kz",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'sans-serif'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: selecionarArquivo,
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
                                  // errorBorder: _erroBorda(),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
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
                                  _authServico.cadastrarUsuario(
                                      cand: candidatoController);
                                  sucesso.value = !sucesso.value;
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
                    Visibility(
                      visible: sucesso.value,
                      child: StreamBuilder<int>(
                        stream: tempo(),
                        builder: (context, AsyncSnapshot<int> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              // ignore: avoid_print
                              print('Encontrado valor nulo');
                              return Container();
                            case ConnectionState.waiting:
                              // ignore: avoid_print
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                              // ignore: avoid_print
                              return const Mensagem(
                                cor: Color.fromRGBO(138, 67, 9, 1),
                                texto: 'Inscrição realizada com sucesso!',
                              );
                            case ConnectionState.done:
                              // ignore: avoid_print
                              print('Terminado');

                              return Center(
                                  child: GestureDetector(
                                onTap: () {
                                  // ignore: avoid_print
                                  print('Faça qualquer coisa');
                                },
                                child: TextButton(
                                  child: const Text(
                                    'Páginal de login',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    candidatoController.reiniciar();
                                    -_authServico.sair();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                    // ignore: avoid_print
                                    // print('Clicou em mim');
                                  },
                                ),
                              ));
                          }
                          // return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Stream<int> tempo() async* {
  int i;
  for (i = 0; i < 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
