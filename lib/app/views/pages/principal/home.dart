import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';
import 'package:sistema_inscricao/app/views/pages/principal/perfil.dart';
import 'package:sistema_inscricao/app/views/pages/principal/estado.dart';
import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';

// import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int indice = 0;
  ValueNotifier<bool> teste = ValueNotifier(false);

  final AutenticacaoServico _authServico = AutenticacaoServico();

  final telas = [const Home(), const Perfil(), const Sobre()];

  int totalInscritos = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: 200).animate(_controller);

    _animation.addListener(() {
      setState(() {
        totalInscritos++;
      });
    });

    // Inicia a animação
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 90,
              alignment: Alignment.bottomLeft,
              color: const Color.fromARGB(255, 24, 56, 97),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'INFORMAÇÕES GERAIS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
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
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 380,
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  )),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'TOTAL INSCRITOS',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Divider(
                      color: Colors.black26,
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 45,
                    backgroundColor: Colors.black12,
                    child: SelectOne(),
                    // child: Text(
                    //   ,
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 18,
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 24, 56, 97),
              alignment: Alignment.topCenter,
              child: Container(
                width: 380,
                height: 290,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: ListView(children: [
                  curso('INFORMÁTICA', 170, Icons.computer),
                  const SizedBox(height: 10),
                  curso('TECOMUNICAÇÃO', 10,
                      Icons.signal_wifi_statusbar_null_sharp),
                  const SizedBox(height: 10),
                  curso('INFORMÁTICA DE GESTÃO', 170, Icons.business),
                ]),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 2),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              maxRadius: 20,
                              child: Icon(
                                Icons.file_copy,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black26),
                                minimumSize: MaterialStateProperty.all(
                                  const Size(100, 30),
                                ),
                              ),
                              child: const Text(
                                'Tópicos',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                // ignore: avoid_print
                                // print('Tópicos...');
                                FirebaseFirestore.instance
                                    .collection('usuarios')
                                    .get()
                                    .then((QuerySnapshot snap) {
                                  for (var doc in snap.docs) {
                                    // ignore: avoid_print
                                    print('Data: $doc.data');
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 2),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              maxRadius: 20,
                              child: Icon(
                                Icons.assessment,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black26),
                                minimumSize: MaterialStateProperty.all(
                                  const Size(100, 30),
                                ),
                              ),
                              child: const Text(
                                'Provas',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                // ignore: avoid_print
                                // print('Tópicos...');
                                FirebaseFirestore.instance
                                    .collection('usuarios')
                                    .get()
                                    .then((QuerySnapshot snap) {
                                  for (var doc in snap.docs) {
                                    // ignore: avoid_print
                                    print('Data: $doc.data');
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 2),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.yellowAccent,
                              maxRadius: 20,
                              child: Icon(
                                Icons.language,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black26),
                                minimumSize: MaterialStateProperty.all(
                                  const Size(100, 30),
                                ),
                              ),
                              child: const Text(
                                'Site',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                // ignore: avoid_print
                                // print('Tópicos...');
                                FirebaseFirestore.instance
                                    .collection('usuarios')
                                    .get()
                                    .then((QuerySnapshot snap) {
                                  for (var doc in snap.docs) {
                                    // ignore: avoid_print
                                    print('Data: $doc.data');
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget curso(String curso, int total, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
    child: Container(
      width: 10,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 2, child: Icon(icon, color: Colors.white)),
          Expanded(
              flex: 5,
              child: Text(
                curso,
                style: const TextStyle(color: Colors.white),
              )),
          Expanded(
              flex: 1,
              child: Text(total.toString(),
                  style: const TextStyle(color: Colors.white))),
        ],
      ),
    ),
  );
}

class SelectOne extends StatelessWidget {
  // final String campo;
  const SelectOne({super.key});

  @override
  Widget build(BuildContext context) {
    // Pega inicialmente todos os usuários
    CollectionReference queryUsuarios =
        FirebaseFirestore.instance.collection('usuarios');

    return StreamBuilder(
      stream: queryUsuarios
          .snapshots(), // O stream é notificado sempre que o documento é alterado
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Mostrar um indicador de carregamento enquanto os dados estão sendo buscados
        }

        if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return const Text('Documentos não encontrado');
        }
        double tam = 13;
        Color cor = Colors.white54;

        // Extrair dados do documento
        final String total = (snapshot.data!.size).toString();

        return Text(
          total,
          style: TextStyle(color: cor, fontSize: tam),
        );
      },
    );
  }
}
