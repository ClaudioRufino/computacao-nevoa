import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/views/components/mensagem_login.dart';
// import 'package:sistema_inscricao/app/views/pages/principal/tela_principal.dart';
import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';
import 'package:sistema_inscricao/app/views/pages/principal/tela_principal.dart';
import 'package:sistema_inscricao/app/views/pages/registar/registar_pessoal.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var t = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _obscureText = true;

  final AutenticacaoServico _authServico = AutenticacaoServico();

  final _keyForm = GlobalKey<FormState>();
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 56, 97),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 24, 56, 97),
          title: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 50,
                    height: 220,
                    color: Colors.white,
                    child: Image.asset(
                      'images/logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Instic-2024',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.ubuntu(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistarPessoal()));
                        }),
                        child: Text(
                          'Registar',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 14,
                            textStyle: const TextStyle(
                                // decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                height: 240,
                child: Image.asset(
                  'images/isutic.jpg',
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                // color: const Color.fromARGB(255, 24, 56, 97),
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(255, 12, 75, 156),
                      Color.fromARGB(255, 24, 56, 97)
                    ],
                  ),
                ),

                child: Center(
                    child: SingleChildScrollView(
                  child: Form(
                    key: _keyForm,
                    child: Column(children: [
                      ListTile(
                        leading: const Icon(
                          Icons.settings_accessibility,
                          color: Colors.white,
                          size: 35,
                        ),
                        title: Text(
                          'ACESSO RESTRITO.',
                          style: GoogleFonts.playfairDisplay(
                              color: Colors.white, fontSize: 16),
                        ),
                        subtitle: Text(
                          'Por favor, faça o login.',
                          style:
                              GoogleFonts.playfairDisplay(color: Colors.white),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      SizedBox(
                        width: 370,
                        child: TextFormField(
                          obscureText: false,
                          controller: _emailController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Email não pode ser nulo.";
                            } else if (!value.contains('@') ||
                                !value.contains('.')) {
                              return 'Coloque no formato de email. ex.:claudio@gmail.com';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                            alignLabelWithHint: true, // Centraliza o hintText

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white60),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),

                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 370,
                        child: TextFormField(
                          obscureText: _obscureText,
                          controller: _senhaController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Senha não pode estar vazia.";
                            } else if (value.length < 6) {
                              return 'Só é permitido mais de 5 caracteres.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white60),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            labelText: 'PALAVRA-CHAVE',
                            labelStyle: const TextStyle(
                                color: Colors.white, fontSize: 12),
                            alignLabelWithHint: true, // Centraliza o hintText
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),

                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white60),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),

                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 240, 132, 9)),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Visibility(
                        visible: login,
                        child: StreamBuilder<int>(
                          stream: tempo(),
                          builder: (context, AsyncSnapshot<int> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return Container();
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.active:
                                // ignore: avoid_print
                                return const MensagemLogin(
                                  cor: Colors.white,
                                  texto: 'Falha ao tentar logar!',
                                );
                              case ConnectionState.done:
                                return const Center();
                            }
                            // return Container();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 370,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_keyForm.currentState!.validate()) {
                              // ignore: avoid_print
                              bool logado = await _authServico.logarUsuario(
                                  email: _emailController.text,
                                  senha: _senhaController.text);
                              // ignore: avoid_print
                              if (logado) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const TelaPrincipal(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  login = true;
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.white),
                          child: const Text(
                            'ENTRAR',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('Clicou em mim!');
                        },
                        child: const Text(
                          'RECUPERAR CREDENCIAIS',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ]),
                  ),
                )),
              ),
            ]),
          ),
        ));
  }
}

Stream<int> tempo() async* {
  int i;
  for (i = 0; i < 2; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
