import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:sistema_inscricao/app/views/pages/login.dart';
import 'package:sistema_inscricao/app/views/pages/principal/perfil.dart';
import 'package:sistema_inscricao/app/views/pages/principal/estado.dart';
// import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';

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

  // final AutenticacaoServico _authServico = AutenticacaoServico();

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
              // color: const Color.fromARGB(255, 24, 56, 97),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'INFORMAÇÕES GERAIS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            // const SizedBox(height: 6),
            Container(
              color: Colors.white,
              child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black26),
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
                        padding: const EdgeInsets.all(8.0),
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black26),
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
                        padding: const EdgeInsets.all(8.0),
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
                                    Icons.description,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black26),
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(100, 30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ficha',
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
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  backgroundColor:
                                      Color.fromARGB(255, 12, 121, 211),
                                  maxRadius: 20,
                                  child: Icon(
                                    Icons.file_copy,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black26),
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(100, 30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Certificado',
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
                        padding: const EdgeInsets.all(8.0),
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
                                  backgroundColor: Color.fromARGB(255, 7, 7, 7),
                                  maxRadius: 20,
                                  child: Icon(
                                    Icons.payment,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black26),
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(100, 30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Recibo',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    // ignore: avoid_print
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
                        padding: const EdgeInsets.all(8.0),
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
                                  backgroundColor:
                                      Color.fromARGB(255, 9, 143, 76),
                                  maxRadius: 20,
                                  child: Icon(
                                    Icons.school,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black26),
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(100, 30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sobre',
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
                ),
              ]),
            ),
            // const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'TOTAL INSCRITOS',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: FutureBuilder<int>(
                      future: inscritos(),
                      builder: (builder, snapshots) {
                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // Mostrar um indicador de carregamento enquanto os dados estão sendo buscados
                        }

                        if (snapshots.hasError) {
                          return Text('Erro: ${snapshots.error}');
                        }

                        if (!snapshots.hasData) {
                          return const Text('Documentos não encontrado');
                        }

                        double tam = 20;
                        Color cor = Colors.white;
                        final total = (snapshots.data).toString();

                        return Text(
                          total,
                          style: TextStyle(color: cor, fontSize: tam),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        curso(
                          'Informática',
                          totalInscritosEm(cursoEscolhido: 'Informática'),
                          Icons.computer,
                        ),
                        curso(
                            'Telecomunicação',
                            totalInscritosEm(cursoEscolhido: 'Telecomunicação'),
                            Icons.network_cell),
                        curso(
                            'Informática de Gestão',
                            totalInscritosEm(cursoEscolhido: 'Gestão'),
                            Icons.network_cell),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget curso(String curso, Widget total, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
    child: Container(
      // width: 10,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 20, 20, 20),
        borderRadius: BorderRadius.circular(20),
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
          Expanded(flex: 1, child: total),
        ],
      ),
    ),
  );
}

Future<Widget> totalInscritosEmCurso(String curso) async {
  await inscritos();
  return totalInscritosEm(cursoEscolhido: curso);
}

Future<int> inscritos() async {
  final CollectionReference queryUsuarios =
      FirebaseFirestore.instance.collection('usuarios');
  QuerySnapshot querySnapshot = await queryUsuarios.get();
  return querySnapshot.docs.length;
}

Widget totalInscritosEm({required String cursoEscolhido}) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('usuarios')
        .where('curso', isEqualTo: cursoEscolhido)
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
      Color cor = Colors.white;
      final total = (snapshot.data!.size).toString();

      return Text(
        total,
        style: TextStyle(color: cor, fontSize: tam),
      );
    },
  );
}
