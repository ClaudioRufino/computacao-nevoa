// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/controllers/candidato_controller.dart';
import 'package:sistema_inscricao/app/repositories/autenticacao_servico/autenticacao_servico.dart';
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
  bool erroTalaoPagamanrto = false;
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
    // var emailController = TextEditingController();

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
                          // color: Colors.white,
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
                                height: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.black12,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 75, 25, 22),
                                        maxRadius: 50,
                                        child: Icon(
                                          size: 60,
                                          Icons.monetization_on,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: const Center(
                                          child: Text(
                                            "TOTAL A PAGAR",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sans-serif'),
                                          ),
                                        ),
                                        subtitle: Center(
                                            child: Text(
                                          "$valorInscricao kz",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Carregar Certificado',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.file_upload,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        // ignore: avoid_print
                                        print(
                                            'Clicou em carregar certificado.');
                                        selecionarArquivo();
                                        // erroCertificado = false;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 330,
                              child: Padding(
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
                                        color: Colors.white30,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: erroTalaoPagamanrto,
                              child: const Text(
                                'Por favor, carrega o certificado.',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            ListTile(
                              title: ElevatedButton(
                                onPressed: () {
                                  _authServico.cadastrarUsuario(
                                      cand: candidatoController);
                                  sucesso.value = !sucesso.value;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black12,
                                ),
                                child: const Text(
                                  'FINALIZAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                              return const Mensagem(
                                cor: Color.fromRGBO(163, 40, 19, 1),
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
                                    textAlign: TextAlign.center,
                                    'Páginal de login. Clique aqui para poder entrar na sua conta e verificar o seu estado de inscrição.',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    candidatoController.reiniciar();
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
