import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistema_inscricao/app/views/pages/principal/tela_principal.dart';
// import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';
// import 'package:sistema_inscricao/app/views/components/input.dart';
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

  // final AutenticacaoServico _authServico = AutenticacaoServico();

  final _keyForm = GlobalKey<FormState>();

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
                  // color: Colors.yellow,
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
                height: 390,
                color: const Color.fromARGB(255, 24, 56, 97),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _keyForm,
                      child: Column(children: [
                        Text(
                          'USER LOGIN',
                          style: GoogleFonts.prompt(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 390,
                          // height: 60,
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
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                size: 16,
                                color: Colors.white,
                              ),
                              hintText: 'email',
                              alignLabelWithHint: true, // Centraliza o hintText
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              hintStyle: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: _bordasRedonda(),
                              ),
                              errorBorder: _erroBorda(),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: _bordasRedonda(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: _bordasRedonda(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 390,
                          child: TextFormField(
                            obscureText: true,
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
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 16,
                                color: Colors.white,
                              ),
                              hintText: 'senha',
                              alignLabelWithHint: true, // Centraliza o hintText
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              hintStyle: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: _bordasRedonda(),
                              ),
                              errorBorder: _erroBorda(),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: _bordasRedonda(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: _bordasRedonda(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 390,
                            height: 40,
                            // color: const Color.fromARGB(255, 134, 111, 111),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Checkbox(
                                    value: t,
                                    onChanged: (value) {
                                      setState(() {
                                        t = value!;
                                      });
                                    },
                                    checkColor: Colors.white,
                                  ),
                                  const Text(
                                    'Guardar senha',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ]),
                                GestureDetector(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print('Clicou em Esqueceu senha');
                                    },
                                    child: const Text(
                                      'Esqueceu a senha?',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 390,
                          child: ElevatedButton(
                            onPressed: () {
                              // _authServico.cadastrarUsuario(
                              //     email: _emailController.text,
                              //     senha: _senhaController.text);

                              // if (_keyForm.currentState!.validate()) {
                              // ignore: avoid_print
                              // print('cadastrado com sucesso!');
                              // } else {
                              // ignore: avoid_print
                              // print('Erro...');
                              // }
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const TelaPrincipal(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Center(
                  child: Text(
                    '@Todos os direitos reservados',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
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
