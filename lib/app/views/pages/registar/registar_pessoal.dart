import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/controller/candidato_controller.dart';
import 'package:sistema_inscricao/app/models/dados_pessoal/pessoal.dart';
import 'package:sistema_inscricao/app/servicos/dados_pessoais_api.dart';
import 'package:sistema_inscricao/app/servicos/estado_global.dart';
import 'package:sistema_inscricao/app/views/components/mensagem.dart';
import 'package:sistema_inscricao/app/views/components/menu_inscricao.dart';
import 'package:sistema_inscricao/app/views/pages/registar/registar_formacao.dart';

class RegistarPessoal extends StatefulWidget {
  const RegistarPessoal({super.key});

  @override
  State<RegistarPessoal> createState() => _RegistarPessoalState();
}

class _RegistarPessoalState extends State<RegistarPessoal> {
  @override
  Widget build(BuildContext context) {
    var pesquisarController = TextEditingController();
    var nomeController = TextEditingController();
    var emailController = TextEditingController();
    var senhaController = TextEditingController();
    var senhaConfirmarController = TextEditingController();
    var dataNascimentoController = TextEditingController();
    var paiController = TextEditingController();
    var maeController = TextEditingController();
    var emitidoController = TextEditingController();

    var dadosPessoaisApi = DadosPessoaisAPI();

    var keyFormPesquisar = GlobalKey<FormState>();
    var keyFormDadosAutenticar = GlobalKey<FormState>();

    var candidatoController = CandidatoController();

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
                          selecionado: true,
                          texto: 'Pessoal',
                          icon: Icons.person_2_sharp),
                      MenuItem(
                          selecionado: false,
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
                      Form(
                        key: keyFormPesquisar,
                        child: Container(
                          color: const Color.fromARGB(255, 24, 56, 97),
                          width: 390,
                          child: TextFormField(
                            controller: pesquisarController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Campo B.I não pode estar vazio.";
                              } else if (value.length < 14) {
                                return 'Número de B.I são 14 caracteres.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 16,
                                color: Colors.blue,
                              ),
                              hintText: 'Número de B.I',
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              hintStyle: GoogleFonts.quicksand(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius: _bordasRedonda(),
                              ),
                              errorBorder: _erroBorda(),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: _bordasRedonda(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: _bordasRedonda(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              });

                          if (keyFormPesquisar.currentState!.validate()) {
                            String bi = pesquisarController.text;
                            bool biEncontrado =
                                await dadosPessoaisApi.existeBI(bi);
                            if (biEncontrado == true) {
                              Pessoal? dadosPessoal =
                                  await dadosPessoaisApi.dadosPessoais(bi);
                              if (dadosPessoal != null) {
                                nomeController.text = dadosPessoal.nome;
                                dataNascimentoController.text =
                                    dadosPessoal.dataNascimento;
                                paiController.text = dadosPessoal.nomePai;
                                maeController.text = dadosPessoal.nomeMae;
                                emitidoController.text = dadosPessoal.emitidoEm;
                              }
                              // ignore: avoid_print
                              // print('BI não encontrado!');

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            } else {
                              // ignore: avoid_print
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                              EstadoGlobal.estadoGlobal.setMensagemErro(true);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(138, 67, 9, 1),
                        ),
                        child: const Text(
                          'Pesquisar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 10,
                        decoration: const BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                child: TextFormField(
                                  readOnly: true,
                                  controller: nomeController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Nome',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: paiController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Nome do pai',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: maeController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.calendar_today,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Nome da mãe',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: emitidoController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person_search,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Emitido em',
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
                                  'Dados de Autenticação',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
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
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Email',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: senhaController,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Senha não pode estar vazia.";
                                    } else if (value.length < 14) {
                                      return 'Só é permitido mais de 5 caracteres.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Senha',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: senhaConfirmarController,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Confirmar senha não pode estar vazio.";
                                    } else if (value.length < 14) {
                                      return 'Só é permitido mais de 5 caracteres.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    hintText: 'Confirmar senha',
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
                                    EstadoGlobal.estadoGlobal
                                        .setMensagemErro(false);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistarFormacao(),
                                      ),
                                    );
                                    candidatoController
                                        .setNome(nomeController.text);
                                    candidatoController.setDataNascimento(
                                        dataNascimentoController.text);
                                    candidatoController
                                        .setNomePai(paiController.text);
                                    candidatoController
                                        .setNomeMae(maeController.text);
                                    candidatoController
                                        .setEmitido(emitidoController.text);
                                    candidatoController
                                        .setEmail(emailController.text);
                                    candidatoController
                                        .setSenha(senhaController.text);
                                    // ignore: avoid_print
                                    // print(
                                    //   'Segundo nome é: ${candidatoController.getNome()}',
                                    // );
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
